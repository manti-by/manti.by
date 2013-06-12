<?php
    function convertToOriginal($request) {
        // Prepare data and fix trailing slash
        $result = '/index.php';
        $request = $request[0] == '/' ? substr($request, 1) : $request;

        // GET request params
        if (strpos($request, '?') !== false) {
            $route = substr($request, 0, strpos($request, '?'));
            $get = substr(strstr($request, '?'), 1);
        } else {
            $route = $request;
            $get = '';
        }

        // Add route params
        if ($route) {
            $route_data = array_diff(explode('/', $route), array('', 'index.php'));
            if (count($route_data)) {
                $result .= '?module=' . $route_data[0];
                if (isset($route_data[1])) {
                    $result .= '&action=' . $route_data[1];

                    // Additional route params
                    for ($i = 2; $i < count($route_data); $i += 2) {
                        if (isset($route_data[$i]) && isset($route_data[$i + 1])) {
                            $result .= '&' . $route_data[$i] . '=' . $route_data[$i + 1];
                        } else {
                            break;
                        }
                    }
                }
            }
        }

        // Add GET params
        if ($get) {
            $result .= strstr($result, '?') ? '&' . $get : '?' . $get;
        }

        return $result;
    }

    $links = array(
        '?',
        '?getparam1=1&getparam2=2',
        'index.php?getparam1=1&getparam2=2',
        'index.php?',
        '/module',
        '/module/',
        '/module?getparam1=1&getparam2=2',
        '/module/action',
        '/module/action/',
        '/module/action/id/1',
        '/module/action/id/1/',
        '/module/action?getparam1=1&getparam2=2',
        '/module/action/?getparam1=1&getparam2=2',
        '/module/action/id/1/?getparam1=1&getparam2=2',
    );

    echo '<table>';
    foreach ($links as $link) {
        echo '<tr><td>' . $link . '</td><td>' . convertToOriginal($link) . '</td></tr>';
    }
    echo '</table>';
