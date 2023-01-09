<?php

class Mankementen extends Controller
{

    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getInstructeurs()
    {
        $this->db->query('SELECT * FROM `instructeur`
        INNER JOIN auto AS auto
        ON instructeur.Id = auto.instructeurId
        WHERE instructeur.Id = 4');
        $results = $this->db->single();
        return $results;


    }

}
