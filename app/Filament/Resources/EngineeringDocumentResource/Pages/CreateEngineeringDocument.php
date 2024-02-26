<?php

namespace App\Filament\Resources\EngineeringDocumentResource\Pages;

use App\Filament\Resources\EngineeringDocumentResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateEngineeringDocument extends CreateRecord
{
    protected static string $resource = EngineeringDocumentResource::class;
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }
}
