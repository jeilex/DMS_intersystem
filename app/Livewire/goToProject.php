<?php

namespace App\Livewire;

use Livewire\Component;
use App\Filament\Resources\ApprovedDocuments;

class goToProject extends Component
{
    protected $listeners = [
        'goToProject' => 'goToProject', // Listen for the "goToProject" event and call the goToProject function
    ];

    public function goToProject()
    {
        redirect(ApprovedDocuments::getUrl());
    }
}
