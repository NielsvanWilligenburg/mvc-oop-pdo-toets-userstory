<?php

class Mankement extends Controller {

    private $overzichtModel;

    public function __construct()
    {
        $this->overzichtModel = $this->model('mankementen');
    }

    public function index() {

        $instructeur = $this->overzichtModel->getInstructeurs();

        echo $instructeur->Naam;
    
        $data = [
            'title' => 'Overzicht Mankementen',
            'naam' => $instructeur->Naam,
            'email' => $instructeur->Email,
            'kenteken' => $instructeur->Kenteken,
            'type' => $instructeur->Type
        ];

        $this->view('mankement/overzicht', $data);
    }

}