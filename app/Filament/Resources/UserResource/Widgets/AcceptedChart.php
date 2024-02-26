<?php

namespace App\Filament\Resources\UserResource\Widgets;

use App\Models\Documents;
use App\Models\SalesSendDocuments;
use App\Models\LogisticsSendDocuments;
use App\Models\AccountingSendDocuments;
use App\Models\PurchasingSendDocuments;
use App\Models\EngineeringSendDocuments;
use App\Models\ProcurementSendDocuments;
use App\Models\AllDocuments;
use Filament\Widgets\ChartWidget;

class AcceptedChart extends ChartWidget
{
    protected static ?string $heading = 'Approved';

    protected function getData(): array
    {
        // Initialize arrays to hold the data and labels
        $chartData = [];
        $labels = [];

        // Fetch approved documents from each model
        $approvedDocuments = [];

        $approvedDocuments[] = AllDocuments::where('status', 'approved')
            ->orderBy('published_at')
            ->get();


        // Combine the results from all models
        $allApprovedDocuments = collect($approvedDocuments)->flatten();

        // Calculate the count of approved documents for each month
        $documentCountByMonth = [];
        foreach ($allApprovedDocuments as $document) {
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
                    'label' => 'Approved Documents',
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

