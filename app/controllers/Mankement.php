<?php

class Mankement extends Controller {

    public function index() {
        $data = [
            'title' => 'Overzicht Mankementen',
        ];

        $this->view('mankement/overzicht', $data);
    }

}