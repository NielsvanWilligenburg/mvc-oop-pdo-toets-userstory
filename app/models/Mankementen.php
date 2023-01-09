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
        ORDER BY mank.Datum DESC');
        $results = $this->db->resultSet();
        return $results;
    }

    public function addMankement($data)
    {
        $this->db->query('INSERT INTO `mankement` (`Id`, `AutoId`, `Datum`, `Mankement`) VALUES (NULL, :AutoId, :datum, :mankement)');
        $this->db->bind(':datum', date('Y-m-d'));
        $this->db->bind(':mankement', $data['mankement']);
        $this->db->bind(':AutoId', $data['autoId']);
        $this->db->execute();
    }

}
