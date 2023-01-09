<?php

class Mankement extends Controller
{

    private $overzichtModel;

    public function __construct()
    {
        $this->overzichtModel = $this->model('mankementen');
    }

    public function index()
    {

        $instructeur = $this->overzichtModel->getInstructeurs();

        $mankementen = $this->overzichtModel->getMankementen();

        $rows = '';

        foreach ($mankementen as $mankementen) {
            $rows .= "<tr>
                        <td>$mankementen->Datum</td>
                        <td>$mankementen->Mankement</td>
                    </tr>";
        }

        $data = [
            'title' => 'Overzicht Mankementen',
            'naam' => $instructeur->Naam,
            'email' => $instructeur->Email,
            'kenteken' => $instructeur->Kenteken,
            'type' => $instructeur->Type,
            'rows' => $rows
        ];

        $this->view('mankement/overzicht', $data);
    }

    public function detail()
    {

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            if(strlen($_POST['mankement']) > 50) {
                echo '<script>
                    alert("Het nieuwe mankement is meer dan 50 tekens lang en is niet toegevoegd");
                    window.location.href="' . URLROOT . '/Mankementen/detail/' . $_POST['id'] . '";
                </script>';
            } else {
                $this->overzichtModel->addMankement($_POST);
                echo '<script>
                alert("Het nieuwe mankement is toegevoegd");
                window.location.href="' . URLROOT . '/Mankementen";
             
            </script>';
            }

        } else {
            $instructeur = $this->overzichtModel->getInstructeurs();

            $data = [
                'title' => 'Mankement toevoegen',
                'kenteken' => $instructeur->Kenteken,
                'type' => $instructeur->Type,
                'id' => $instructeur->Id,
                'AutoId' => $instructeur->AutoId
            ];

            $this->view('mankement/detail', $data);
        }
    }
}
