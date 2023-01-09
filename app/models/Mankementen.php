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
        INNER JOIN mankement AS mank
        ON auto.Id = mank.AutoId
        WHERE instructeur.Id = 3');
        $results = $this->db->single();
        return $results;
    }

    public function getMankementen()
    {
        $this->db->query('SELECT * FROM `instructeur`
        INNER JOIN auto AS auto
        ON instructeur.Id = auto.instructeurId
        INNER JOIN mankement AS mank
        ON auto.Id = mank.AutoId
        WHERE instructeur.Id = 3
        ORDER BY mank.Datum ASC');
        $results = $this->db->resultSet();
        return $results;
    }

}
