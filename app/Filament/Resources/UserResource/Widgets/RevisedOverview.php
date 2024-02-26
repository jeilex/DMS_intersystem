<?php

namespace App\Filament\Resources\UserResource\Widgets;

use App\Models\AllDocuments;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use App\Filament\Resources\RevisedDocuments;
use Livewire\Livewire;

class RevisedOverview extends BaseWidget
{
    protected function getStats(): array
    {
        $approvedCount = AllDocuments::where('status', 'revised')->count();

        return [
            Stat::make('Approved Documents', $approvedCount)
                ->description('Total Revised Documents')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->chart([$revisedCount, 0, 0, 0, 0, 0, 0]) // Chart showing only approved count for simplicity
                ->color('warning')
        ];
    }

}
       

