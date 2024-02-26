<?php

namespace App\Filament\Resources\UserResource\Widgets;

use App\Models\AllDocuments;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;

class RejectedOverview extends BaseWidget
{
    protected function getStats(): array
    {
        $rejectedCount = AllDocuments::where('status', 'reject')->count();

        return [
            Stat::make('Rejected Documents', $rejectedCount)
                ->description('Total Rejected Documents')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->chart([$rejectedCount, 0, 0, 0, 0, 0, 0]) // Chart showing only reject count for simplicity
                ->color('warning'),
        ];
    }
   
}
