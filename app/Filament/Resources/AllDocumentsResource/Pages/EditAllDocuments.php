<?php

namespace App\Filament\Resources\AllDocumentsResource\Pages;

use App\Filament\Resources\AllDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditAllDocuments extends EditRecord
{
    protected static string $resource = AllDocumentsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
