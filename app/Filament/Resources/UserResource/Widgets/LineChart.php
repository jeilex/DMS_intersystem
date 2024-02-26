<?php

namespace App\Filament\Resources\UserResource\Widgets;

use Filament\Widgets\ChartWidget;
use App\Models\AccountingSendDocuments;
use App\Models\SalesSendDocuments;
use App\Models\EngineeringSendDocuments;
use App\Models\LogisticsSendDocuments;
use App\Models\ProcurementSendDocuments;
use App\Models\PurchasingSendDocuments;
use App\Models\SendDocuments;

class LineChart extends ChartWidget
{
    protected static ?string $heading = 'Pending';

    protected function getData(): array
    {
        // Initialize arrays to hold the data and labels
        $chartData = [];
        $labels = [];

        // Fetch pending documents from each model
        $pendingDocuments = [];

        $pendingDocuments[] = AccountingSendDocuments::where('status', 'pending')
            ->orderBy('published_at')
            ->get();

        $pendingDocuments[] = SalesSendDocuments::where('status', 'pending')
            ->orderBy('published_at')
            ->get();

        $pendingDocuments[] = EngineeringSendDocuments::where('status', 'pending')
            ->orderBy('published_at')
            ->get();

        $pendingDocuments[] = LogisticsSendDocuments::where('status', 'pending')
            ->orderBy('published_at')
            ->get();

        $pendingDocuments[] = ProcurementSendDocuments::where('status', 'pending')
            ->orderBy('published_at')
            ->get();

        $pendingDocuments[] = PurchasingSendDocuments::where('status', 'pending')
            ->orderBy('published_at')
            ->get();

        $pendingDocuments[] = SendDocuments::where('status', 'pending')
            ->orderBy('published_at')
            ->get();

        // Combine the results from all models
        $allPendingDocuments = collect($pendingDocuments)->flatten();

        // Calculate the count of pending documents for each month
        $documentCountByMonth = [];
        foreach ($allPendingDocuments as $document) {
            $monthAbbreviation = date('M', strtotime($document->published_at));
            if (!isset($documentCountByMonth[$monthAbbreviation])) {
                $documentCountByMonth[$monthAbbreviation] = 0;
            }
            $documentCountByMonth[$monthAbbreviation]++;
        }

        // Generate data for each month
        foreach (range(1, 12) as $month) {
            $monthAbbreviation = date('M', mktime(0, 0, 0, $month, 1));
            $labels[] = $monthAbbreviation;
            $chartData[] = $documentCountByMonth[$monthAbbreviation] ?? 0;
        }

        // Define the background color
        $backgroundColor = ['#3E3232'];

        // Construct the data array
        return [
            'datasets' => [
                [
                    'label' => 'Pending Documents',
                    'data' => $chartData,
                    'backgroundColor' => $backgroundColor,
                ],
            ],
            'labels' => $labels,
        ];
    }

    protected function getFilters(): ?array
    {
        // Generate years from the current year to 10 years ago
        $years = range(now()->year, now()->subYears(10)->year);

        // Generate filter options for the dropdown
        $filterOptions = [];
        foreach ($years as $year) {
            $filterOptions[$year] = $year;
        }

        return [
            'year' => 'Select Year',
        ];
    }

    protected function getType(): string
    {
        return 'line';
    }
}
