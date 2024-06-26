<?php

namespace App\Filament\Resources\EngineeringDocumentResource\Pages;

use App\Filament\Resources\EngineeringDocumentResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListEngineeringDocuments extends ListRecords
{
    protected static string $resource = EngineeringDocumentResource::class;

    protected function getHeaderActions(): array
    {
        return [
        ];
    }
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }
}
