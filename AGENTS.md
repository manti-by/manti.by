# AGENTS.md

## Project Overview

Django custom blog engine for music and photo publishing.

## Project Structure

- All REST API related code placed in `./manti_by/api/`
- Django apps with models, admin classes, migrations and management commands in `./manti_by/apps/`
- Tests in `./manti_by/tests/`
- Static files like images, CSS and JS in `./manti_by/static/`
- Django templates in `./manti_by/templates/`

## Development Commands

### Package Management

```bash
uv sync                    # Install dependencies
uv sync --upgrade          # Upgrade dependencies
```

### Django Management

```bash
uv run manage.py runserver                  # Start development server
uv run manage.py migrate                    # Run database migrations
uv run manage.py makemigrations             # Create new migrations
uv run manage.py collectstatic --no-input   # Collect static files
uv run manage.py makemessages -l ru         # Create translation files
uv run manage.py compilemessages -l ru      # Compile translation files
```

### Database Operations

```bash
# Development
make dump     # Backup database to manti_by.sql
make restore  # Restore database from manti_by.sql
make migrate  # Run database migrations
make migrations  # Create new migrations
make locale   # Compile translation files

# Django checks
uv run manage.py makemigrations --dry-run --check --verbosity=3 --settings=manti_by.settings.sqlite
uv run manage.py check --fail-level WARNING --settings=manti_by.settings.sqlite
```

### Testing

```bash
# Run all tests
uv run pytest --create-db --disable-warnings --ds=manti_by.settings.test manti_by/

# Run single test file
uv run pytest --create-db --disable-warnings --ds=manti_by.settings.test manti_by/tests/api/test_sensors.py

# Run single test method
uv run pytest --create-db --disable-warnings --ds=manti_by.settings.test manti_by/tests/api/test_sensors.py::TestSensorsAPI::test_sensors__list

# Run with coverage (if available)
uv run pytest --cov=manti_by --cov-report=term-missing manti_by/
```

### Code Quality

```bash
# Run all pre-commit hooks
uv run pre-commit run

# Individual tools
uv run ruff check .                 # Lint
uv run ruff format .                # Format
uv run bandit -c pyproject.toml .   # Security analysis
```

### Database Operations

```bash
# Development
make dump     # Backup database to manti_by.sql
make restore  # Restore database from manti_by.sql

# Django checks
uv run manage.py makemigrations --dry-run --check --verbosity=3 --settings=manti_by.settings.sqlite
uv run manage.py check --fail-level WARNING --settings=manti_by.settings.sqlite
```

## Language & Environment

- Follow PEP 8 style guidelines, use Ruff for formatting (120 char line length)
- Use type hints for all function parameters and return values
- Prefer f-strings for string formatting over .format() or %
- Use list/dict/set comprehensions over map/filter when readable
- Prefer Pathlib over os.path for file operations
- Follow PEP 257 for docstrings (simple summary line plus detailed explanation)
- Use structural pattern matching (match/case) for complex conditionals
- Prefer EAFP (try/except) over LBYL (if checks) for Python idioms

## Django Framework

- Follow Django best practices and the MVT pattern
- Use Django ORM effectively, avoid raw SQL
- Use select_related and prefetch_related to avoid N+1 queries
- Never modify migrations after deployment
- Class-based views for API, function-based views for Django apps views
- Put business logic to services, prefer functions, models and views should be short and clean

### Background Tasks

- Use RQ for long-running or resource-intensive operations
- Define jobs as additional functions with prefix `queue_`
- Configure queue names for different priority levels

```python
import django_rq


def sync_sensor_data(sensor_id: str):
    # Long-running sync operation
    return sensor_id


def queue_sync_sensor_data(sensor_id: str):
    queue = django_rq.get_queue("default")
    queue.enqueue(sync_sensor_data, sensor_id=sensor_id)
```

### Periodic Jobs

- Use APScheduler for scheduled tasks
- Define jobs in `manti_by/apps/core/scheduler.py` within the app
- Use `scheduler.scheduled_job` for scheduling

```python
from apscheduler.schedulers.blocking import BlockingScheduler
from django.conf import settings
from django.core.management import call_command

scheduler = BlockingScheduler(timezone=settings.TIME_ZONE)


@scheduler.scheduled_job("interval", minutes=30, id="update_weather")
def schedule_update_weather():
    call_command("update_weather")
```

## Code Style Guidelines

### Python Standards

- Python version 3.13+ with type hints encouraged
- Ensure code style consistency using Ruff
- Line length 120 characters
- Indentation 4 spaces

### Import Organization

Use Ruff isort with this order:

1. `__future__` imports
2. Standard library imports
3. Third-party imports
4. First-party imports
5. Django imports
6. manti_by imports

```python
from __future__ import annotations

import os
from decimal import Decimal

from django.db import models
from rest_framework import serializers

from manti_by.apps.sensors.models import Sensor
```

### Naming Conventions

- **Models**: `PascalCase` (e.g., `SensorLog`)
- **Functions/Variables**: `snake_case` (e.g., `get_sensor_data`)
- **Constants**: `UPPER_SNAKE_CASE` (e.g., `MAX_RETRY_COUNT`)
- **File Names**: `snake_case.py` (e.g., `sensor_utils.py`)
- **Classes**: `PascalCase` (e.g., `SensorService`)

### Type Hints

Use type hints for function signatures and complex variables:

```python
from decimal import Decimal


def get_sensor_data(sensor_id: str) -> dict[str, Decimal] | None:
    # Implementation here
    return None
```

### Django Patterns

#### Models

- Use `__future__ import annotations` for forward references
- Include `created_at` and `updated_at` timestamp fields
- Use `verbose_name` and `verbose_name_plural` with translation support
- Implement custom QuerySets and Managers for complex queries
- Use `TextChoices` for enum fields

```python
from django.db import models
from django.utils.translation import gettext_lazy as _


class Sensor(models.Model):
    sensor_id = models.CharField(max_length=32, verbose_name=_("Sensor ID"))
    created_at = models.DateTimeField(auto_now_add=True, verbose_name=_("Created at"))
    updated_at = models.DateTimeField(auto_now=True, verbose_name=_("Updated at"))

    class Meta:
        verbose_name = _("sensor")
        verbose_name_plural = _("sensors")
```

#### Views and ViewSets

- Use GenericViewSet with mixins for REST APIs if data retrieved directly from a database, e.g. `SensorsView`
- Use APIView with mixins for REST APIs if data generated, e.g. `DS18B20DataView`
- Include proper type hints for Request/Response
- Use `lookup_field` for custom URL parameters
- Implement `perform_create`/`perform_update` for custom logic

#### Serializers

- Use explicit field definitions for clarity
- Include validation constraints
- Use `ChoiceField` for enum fields
- Do not use a ModelSerializer, just a bare Serializer

#### API Versioning

- URL-based versioning: `/api/v1/...`
- Include version in DRF router namespace: `api:v1:sensors:list`
- Increment version for breaking changes only

## Dependency Management

- Manage dependencies via **[uv](https://github.com/astral-sh/uv)** and **virtual environments**.

## Testing

- Focus testing on APIs and critical code paths
- Write integration tests for API endpoints and external integrations
- Use mocks for external services and slow dependencies
- Test error handling and validation logic
- Use meaningful test names that describe the scenario

### Testing Patterns

#### Test Structure

- Use pytest with pytest-django
- Create descriptive test method names with double underscores
- Use Factory Boy for test data
- Test both success and error cases
- Use parametrized tests for similar scenarios

```python
import pytest

from manti_by.tests.factories import SensorFactory
from rest_framework import status
from rest_framework.reverse import reverse
from rest_framework.test import APIClient


@pytest.mark.django_db
class TestSensorsAPI:
    def setup_method(self):
        self.client = APIClient()
        self.url = reverse("api:v1:sensors:list")

    def test_sensors__list_returns_active_only(self):
        SensorFactory(is_active=True)
        SensorFactory(is_active=False)

        response = self.client.get(self.url, format="json")
        assert response.status_code == status.HTTP_200_OK
        assert response.data["count"] == 1
```

#### Test Data

- Use Factory Boy for creating test instances
- Use meaningful default values in factories
- Test with different data variations

## Logging and Error Handling

### Logging

- Use Python's `logging` module, not print statements
- Create logger at module level: `logger = logging.getLogger(__name__)`
- Use appropriate log levels:
    - `DEBUG`: Detailed debug information
    - `INFO`: Confirmation of expected behavior
    - `WARNING`: Unexpected but handled issues
    - `ERROR`: Failures that need attention

```python
import logging

from tinytag import ParseError

from manti_by.apps.music.services import update_or_create_music

logger = logging.getLogger(__name__)


def process_file(file: str):
    logger.info(f"Processing file {file}")
    try:
        music, _ = update_or_create_music(file=file)
        logger.info(f"{file}: [{music.album}] {music.artist} - {music.title} - {music.year}")
    except ParseError as e:
        logger.error(f"{file}: {e}")
```

### Error Handling

- Use custom exception classes for domain-specific errors
- Log exceptions with context before re-raising

```python
class SensorError(Exception):
    """Base exception for sensor-related errors."""


class SensorNotFoundError(SensorError):
    """Raised when a sensor cannot be found."""


class SensorConnectionError(SensorError):
    """Raised when connection to a sensor fails."""
```

## Environment Configuration

### Settings Files

- `base.py`: Common settings
- `dev.py`: Development (DEBUG=True, ALLOWED_HOSTS="*")
- `test.py`: Testing (DEBUG=False, minimal logging)
- `prod.py`: Production settings
- `sqlite.py`: SQLite settings for Django checks

### Database

- **Development/Production**: PostgreSQL
- **Testing**: SQLite (configured in test settings)

## Security Guidelines

- Never commit secrets or API keys
- Use environment variables for sensitive configuration
- Run `bandit` security analysis before commits
- Validate all user inputs

## Pre-commit Hooks

The project uses pre-commit hooks for code quality:

- Ruff (linting and formatting)
- Bandit (security analysis)
- pyupgrade (Python 3.13+ syntax)
- curlylint (HTML linting)

## Deployment

- Services: gunicorn, worker, scheduler, nginx
- Use systemd for service management

## Common Issues

### Testing

- Always use `@pytest.mark.django_db` for database tests
- Use `--create-db` flag for a fresh test database

### Migrations

- Check for pending migrations: `make django-checks`
- Create migrations after model changes

## Performance Optimization

- Use `select_related` and `prefetch_related` for query optimization
- Implement proper database indexing
- Cache frequently accessed data with Redis

## AI Behavior

Response style - Concise and minimal:

- Provide minimal, working code without unnecessary explanation
- Omit comments unless absolutely essential for understanding
- Skip boilerplate and obvious patterns unless requested
- Use type inference and shorthand syntax where possible
- Focus on the core solution, skip tangential suggestions
- Assume familiarity with language idioms and framework patterns
- Let code speak for itself through clear naming and structure
- Avoid over-explaining standard patterns and conventions
- Provide just enough context to understand the solution
- Trust the developer to handle obvious cases independently
