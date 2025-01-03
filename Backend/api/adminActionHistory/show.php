<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
include_once '../../config/db.php';
include_once '../../model/adminActionHistory.php';
include_once '../../middleware/middleware.php';

$db = new db();
$connect = $db->connect();

$middleware = new Middleware($connect);
$middleware->checkAdmin();

$adminActionHistory = new AdminActionHistory($connect);

$adminActionHistory->actionId = isset($_GET['actionId']) ? $_GET['actionId'] : die();

$adminActionHistory->show();

$action_arr = array(
    'actionId' => $adminActionHistory->actionId,
    'adminId' => $adminActionHistory->adminId,
    'action' => $adminActionHistory->action
);

print_r(json_encode($action_arr));