<?php

namespace App\Filament\Resources\EngineeringSendDocumentsResource\Pages;

use App\Filament\Resources\EngineeringSendDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListEngineeringSendDocuments extends ListRecords
{
    protected static string $resource = EngineeringSendDocumentsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }
}
