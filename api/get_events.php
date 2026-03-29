<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

require_once '../db.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    try {
        $sql = "SELECT 
                    e.id, 
                    e.season,
                    e.status,
                    e.date_venue, 
                    e.time_venue_utc, 
                    e.home_goals, 
                    e.away_goals, 
                    e.stage_name,
                    s.name AS sport_name,
                    ht.name AS home_team,
                    at.name AS away_team,
                    v.name AS venue_name
                FROM events e
                LEFT JOIN sports s ON e._sport_id = s.id
                LEFT JOIN teams ht ON e._home_team_id = ht.id
                LEFT JOIN teams at ON e._away_team_id = at.id
                LEFT JOIN venues v ON e._venue_id = v.id
                ORDER BY e.date_venue DESC, e.time_venue_utc DESC";
        
        $stmt = $pdo->query($sql);
        $events = $stmt->fetchAll(); 
        
        echo json_encode($events);
    } catch (PDOException $e) {
        http_response_code(500);
        echo json_encode(["error" => $e->getMessage()]);
    }
} else {
    http_response_code(405);
    echo json_encode(["error" => "Method not allowed"]);
}
?>