<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type');

require_once '../db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"));

    if (!empty($data->date_venue) && !empty($data->time_venue_utc) && !empty($data->_sport_id) && !empty($data->_home_team_id) && !empty($data->_away_team_id)) {
        try {
            $sql = "INSERT INTO events (season, status, date_venue, time_venue_utc, home_goals, away_goals, stage_name, _sport_id, _home_team_id, _away_team_id, _venue_id) 
                    VALUES (:season, :status, :date_venue, :time_venue_utc, :home_goals, :away_goals, :stage_name, :sport_id, :home_team_id, :away_team_id, :venue_id)";
            
            $stmt = $pdo->prepare($sql);
            
            $stmt->execute([
                ':season' => $data->season ?? null,
                ':status' => $data->status ?? 'scheduled',
                ':date_venue' => $data->date_venue,
                ':time_venue_utc' => $data->time_venue_utc,
                ':home_goals' => $data->home_goals ?? 0,
                ':away_goals' => $data->away_goals ?? 0,
                ':stage_name' => $data->stage_name ?? null,
                ':sport_id' => $data->_sport_id,
                ':home_team_id' => $data->_home_team_id,
                ':away_team_id' => $data->_away_team_id,
                ':venue_id' => $data->_venue_id ?? null
            ]);
            
            http_response_code(201);
            echo json_encode(["message" => "Event created", "id" => $pdo->lastInsertId()]);
        } catch (PDOException $e) {
            http_response_code(500);
            echo json_encode(["error" => $e->getMessage()]);
        }
    } else {
        http_response_code(400);
        echo json_encode(["error" => "Missing required fields"]);
    }
} else {
    http_response_code(405);
    echo json_encode(["error" => "Method not allowed"]);
}
?>