<?php

namespace App\Filament\Resources\UserResource\Widgets;

use App\Models\AllDocuments;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use App\Filament\Resources\ApprovedDocuments;
use Livewire\Livewire;

class AcceptedOverview extends BaseWidget
{
    protected function getStats(): array
    {
        $approvedCount = AllDocuments::where('status', 'approved')->count();

        return [
            Stat::make('Approved Documents', $approvedCount)
                ->description('Total Approved Documents')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->chart([$approvedCount, 0, 0, 0, 0, 0, 0]) // Chart showing only approved count for simplicity
                ->color('warning')
                ->extraAttributes([
                    'x-on:click' => 'redirectToApprovedDocuments()'
                ]),
        ];
    }

}
       

