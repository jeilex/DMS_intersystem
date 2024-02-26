<?php

namespace App\Filament\Resources\LogisticsDocumentResource\Pages;

use App\Filament\Resources\LogisticsDocumentResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateLogisticsDocument extends CreateRecord
{
    protected static string $resource = LogisticsDocumentResource::class;
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }
}
