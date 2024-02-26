<?php

namespace App\Filament\Resources\LogisticsSendDocumentsResource\Pages;

use App\Filament\Resources\LogisticsSendDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateLogisticsSendDocuments extends CreateRecord
{
    protected static string $resource = LogisticsSendDocumentsResource::class;
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }
}
