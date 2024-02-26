<?php

namespace App\Filament\Resources\LogisticsDocumentResource\Pages;

use App\Filament\Resources\LogisticsDocumentResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditLogisticsDocument extends EditRecord
{
    protected static string $resource = LogisticsDocumentResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }
}
