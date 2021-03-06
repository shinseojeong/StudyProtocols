# Copyright 2017 Observational Health Data Sciences and Informatics
#
# This file is part of LargeScalePopEst
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#' Filter exposure pairs by size of the cohorts
#'
#' @param workFolder           Name of local folder to place results; make sure to use forward slashes
#'                             (/)
#' @param minCohortsSize       Minimum number of people that have to be in each cohort to keep a pair of
#'                             cohorts.
#'
#' @export
filterByExposureCohortsSize <- function(workFolder, minCohortsSize = 2500) {
    exposureSummary <- read.csv(file.path(workFolder, "exposureSummary.csv"))
    filtered <- exposureSummary[exposureSummary$tprimeNumPersons > minCohortsSize & exposureSummary$cprimeNumPersons > minCohortsSize, ]
    write.csv(filtered, file.path(workFolder, "exposureSummaryFilteredBySize.csv"), row.names = FALSE)
}
