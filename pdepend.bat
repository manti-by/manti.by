@echo off
"C:\www\php5\pdepend" --jdepend-chart=.\docs\pdepend\jdepend-chart.svg --jdepend-xml=docs\pdepend\jdepend.xml --overview-pyramid=docs\pdepend\overview.svg --summary-xml=docs\pdepend\summary.xml trunk
PAUSE