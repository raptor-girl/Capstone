CREATE TABLE "AuditLogEntries" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_AuditLogEntries" PRIMARY KEY,
    "BuildingExternalId" TEXT NOT NULL,
    "EntityType" TEXT NOT NULL,
    "EntityId" TEXT NOT NULL,
    "ActionType" TEXT NOT NULL,
    "Resource" TEXT NOT NULL,
    "Result" TEXT NOT NULL,
    "Severity" TEXT NOT NULL,
    "Summary" TEXT NOT NULL,
    "Details" TEXT NOT NULL,
    "PreviousValue" TEXT NOT NULL,
    "NewValue" TEXT NOT NULL,
    "ChangedByUsername" TEXT NOT NULL,
    "ClientIp" TEXT NOT NULL,
    "UserAgent" TEXT NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL
);
CREATE TABLE "AuthUsers" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_AuthUsers" PRIMARY KEY,
    "CanManageUsers" INTEGER NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "CreatedBy" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "DeletedBy" TEXT NOT NULL,
    "FailedLoginAttempts" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL,
    "LastLoginAtUtc" TEXT NULL,
    "LockedUntilUtc" TEXT NULL,
    "MfaEnabled" INTEGER NOT NULL,
    "MfaEnrolledAtUtc" TEXT NULL,
    "MfaLastVerifiedAtUtc" TEXT NULL,
    "MfaSecretProtected" TEXT NOT NULL,
    "NormalizedUsername" TEXT NOT NULL,
    "PasswordHash" TEXT NOT NULL,
    "Role" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "Username" TEXT NOT NULL,
    "Version" INTEGER NOT NULL
);
CREATE TABLE "BackupHistories" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_BackupHistories" PRIMARY KEY,
    "Status" TEXT NOT NULL,
    "FilePath" TEXT NOT NULL,
    "SizeBytes" INTEGER NOT NULL,
    "Hash" TEXT NOT NULL,
    "ErrorMessage" TEXT NOT NULL,
    "Reason" TEXT NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL
);
CREATE TABLE "BuildingGeometryOverrides" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_BuildingGeometryOverrides" PRIMARY KEY,
    "BuildingExternalId" TEXT NOT NULL,
    "GeometryJson" TEXT NOT NULL,
    "CentroidLatitude" REAL NULL,
    "CentroidLongitude" REAL NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL
);
CREATE TABLE "Equipments" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_Equipments" PRIMARY KEY,
    "Name" TEXT NOT NULL,
    "Category" TEXT NOT NULL,
    "SerialNumber" TEXT NOT NULL,
    "Status" TEXT NOT NULL,
    "Notes" TEXT NULL,
    "LocationId" TEXT NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL,
    CONSTRAINT "FK_Equipments_Locations_LocationId" FOREIGN KEY ("LocationId") REFERENCES "Locations" ("Id") ON DELETE CASCADE
);
CREATE TABLE "ImportedInventoryItems" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_ImportedInventoryItems" PRIMARY KEY,
    "AnnexPhone" TEXT NOT NULL,
    "AssignedBuildingExternalId" TEXT NOT NULL,
    "AssignedFloor" INTEGER NULL,
    "AssignedRoomExternalId" TEXT NOT NULL,
    "AssignmentNotes" TEXT NOT NULL,
    "AssignmentUpdatedAtUtc" TEXT NULL,
    "CategorySource" TEXT NOT NULL,
    "ClassificationConfidence" REAL NULL,
    "ClassificationDetail" TEXT NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "CreatedBy" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "DeletedBy" TEXT NOT NULL,
    "DeliveryFormPdfFileName" TEXT NOT NULL,
    "Description" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "ImportedAtUtc" TEXT NOT NULL,
    "InferredCategory" TEXT NOT NULL,
    "InferredStatus" TEXT NOT NULL,
    "InstallDate" TEXT NOT NULL,
    "Installer" TEXT NOT NULL,
    "InventoryDate" TEXT NOT NULL,
    "IpAddress" TEXT NOT NULL,
    "IsActive" INTEGER NOT NULL,
    "ItemNumber" TEXT NOT NULL,
    "JobTitle" TEXT NOT NULL,
    "Lot" TEXT NOT NULL,
    "MacAddress" TEXT NOT NULL,
    "MatchConfidence" TEXT NOT NULL,
    "MatchNotes" TEXT NOT NULL,
    "MatchedBuildingExternalId" TEXT NOT NULL,
    "MatchedRoomExternalId" TEXT NOT NULL,
    "MatchedSyncedBuildingId" TEXT NULL,
    "MatchedSyncedRoomId" TEXT NULL,
    "Observation" TEXT NOT NULL,
    "OrganizationalUnit" TEXT NOT NULL,
    "ReplacedEquipment" TEXT NOT NULL,
    "ResponsibleUser" TEXT NOT NULL,
    "RowNumber" INTEGER NOT NULL,
    "Run" TEXT NOT NULL,
    "Rut" TEXT NOT NULL,
    "SerialNumber" TEXT NOT NULL,
    "SourceFile" TEXT NOT NULL,
    "TicketMda" TEXT NOT NULL,
    "UnitOrDepartment" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL
);
CREATE TABLE "InventoryAliasRules" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_InventoryAliasRules" PRIMARY KEY,
    "SourceText" TEXT NOT NULL,
    "NormalizedSourceText" TEXT NOT NULL,
    "TargetBuildingExternalId" TEXT NOT NULL,
    "TargetRoomExternalId" TEXT NOT NULL,
    "IsEnabled" INTEGER NOT NULL,
    "Notes" TEXT NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL
);
CREATE TABLE "InventoryDocuments" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_InventoryDocuments" PRIMARY KEY,
    "InventoryItemId" TEXT NOT NULL,
    "OriginalFileName" TEXT NOT NULL,
    "StoredFileName" TEXT NOT NULL,
    "ContentType" TEXT NOT NULL,
    "SizeBytes" INTEGER NOT NULL,
    "Source" TEXT NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL,
    CONSTRAINT "FK_InventoryDocuments_ImportedInventoryItems_InventoryItemId" FOREIGN KEY ("InventoryItemId") REFERENCES "ImportedInventoryItems" ("Id") ON DELETE CASCADE
);
CREATE TABLE "Locations" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_Locations" PRIMARY KEY,
    "Name" TEXT NOT NULL,
    "Description" TEXT NOT NULL,
    "Latitude" REAL NOT NULL,
    "Longitude" REAL NOT NULL,
    "Floor" TEXT NOT NULL,
    "Campus" TEXT NOT NULL,
    "Type" TEXT NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL
);
CREATE TABLE "ManualBuildings" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_ManualBuildings" PRIMARY KEY,
    "ExternalId" TEXT NOT NULL,
    "Campus" TEXT NOT NULL,
    "DisplayName" TEXT NOT NULL,
    "Type" TEXT NOT NULL,
    "Notes" TEXT NOT NULL,
    "FloorsJson" TEXT NOT NULL,
    "GeometryJson" TEXT NOT NULL,
    "CentroidLatitude" REAL NULL,
    "CentroidLongitude" REAL NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL
);
CREATE TABLE "ManualRooms" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_ManualRooms" PRIMARY KEY,
    "ExternalId" TEXT NOT NULL,
    "BuildingExternalId" TEXT NOT NULL,
    "Floor" INTEGER NOT NULL,
    "DisplayName" TEXT NOT NULL,
    "ShortName" TEXT NOT NULL,
    "Type" TEXT NOT NULL,
    "Unit" TEXT NOT NULL,
    "Service" TEXT NOT NULL,
    "Status" TEXT NOT NULL,
    "Capacity" INTEGER NULL,
    "GeometryJson" TEXT NOT NULL,
    "Source" TEXT NOT NULL,
    "Notes" TEXT NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL
);
CREATE TABLE MapMarkers (
    Id TEXT NOT NULL CONSTRAINT PK_MapMarkers PRIMARY KEY,
    ExternalId TEXT NOT NULL,
    Campus TEXT NOT NULL,
    BuildingExternalId TEXT NOT NULL,
    Floor INTEGER NOT NULL,
    Latitude REAL NOT NULL,
    Longitude REAL NOT NULL,
    IconKey TEXT NOT NULL,
    Label TEXT NOT NULL,
    Notes TEXT NOT NULL,
    Source TEXT NOT NULL,
    IsActive INTEGER NOT NULL DEFAULT 1,
    DeletedAtUtc TEXT NULL,
    DeletedBy TEXT NULL,
    CreatedBy TEXT NOT NULL,
    CreatedAtUtc TEXT NOT NULL,
    UpdatedBy TEXT NULL,
    UpdatedAtUtc TEXT NOT NULL,
    Version INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE "MlTrainingRuns" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_MlTrainingRuns" PRIMARY KEY,
    "ModelType" TEXT NOT NULL,
    "Samples" INTEGER NOT NULL,
    "Accuracy" REAL NOT NULL,
    "F1Score" REAL NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL
);
CREATE TABLE "NetworkTelemetryObservations" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_NetworkTelemetryObservations" PRIMARY KEY,
    "NetworkTelemetrySnapshotId" TEXT NOT NULL,
    "ObservationType" TEXT NOT NULL,
    "ExternalKey" TEXT NOT NULL,
    "DeviceName" TEXT NOT NULL,
    "Username" TEXT NOT NULL,
    "Domain" TEXT NOT NULL,
    "IpAddress" TEXT NOT NULL,
    "MacAddress" TEXT NOT NULL,
    "SerialNumber" TEXT NOT NULL,
    "HostName" TEXT NOT NULL,
    "DeviceCategory" TEXT NOT NULL,
    "OperatingSystem" TEXT NOT NULL,
    "OperatingSystemVersion" TEXT NOT NULL,
    "Manufacturer" TEXT NOT NULL,
    "Model" TEXT NOT NULL,
    "Processor" TEXT NOT NULL,
    "MemoryGb" REAL NULL,
    "DiskTotalGb" REAL NULL,
    "DiskFreeGb" REAL NULL,
    "LastBootAtUtc" TEXT NULL,
    "IsOnline" INTEGER NULL,
    "DomainJoined" INTEGER NULL,
    "IsVirtualMachine" INTEGER NULL,
    "PingMs" INTEGER NULL,
    "AntivirusStatus" TEXT NOT NULL,
    "AntivirusVersion" TEXT NOT NULL,
    "PatchStatus" TEXT NOT NULL,
    "AgentVersion" TEXT NOT NULL,
    "OpenPorts" TEXT NOT NULL,
    "SubnetCidr" TEXT NOT NULL,
    "NetworkProfile" TEXT NOT NULL,
    "BuildingExternalId" TEXT NOT NULL,
    "RoomExternalId" TEXT NOT NULL,
    "ImportedInventoryItemId" TEXT NULL,
    "SyncedEquipmentId" TEXT NULL,
    "AuthUserId" TEXT NULL,
    "Status" TEXT NOT NULL,
    "RiskLevel" TEXT NOT NULL,
    "RiskScore" INTEGER NOT NULL,
    "RiskReasonsJson" TEXT NOT NULL,
    "RawJson" TEXT NOT NULL,
    "ObservedAtUtc" TEXT NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL, "MatchKey" TEXT NOT NULL DEFAULT '', "MlProbability" REAL NULL, "RuleBasedScore" INTEGER NULL, "ScoringSource" TEXT NOT NULL DEFAULT '',
    CONSTRAINT "FK_NetworkTelemetryObservations_NetworkTelemetrySnapshots_NetworkTelemetrySnapshotId" FOREIGN KEY ("NetworkTelemetrySnapshotId") REFERENCES "NetworkTelemetrySnapshots" ("Id") ON DELETE CASCADE
);
CREATE TABLE "NetworkTelemetrySnapshots" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_NetworkTelemetrySnapshots" PRIMARY KEY,
    "SourceName" TEXT NOT NULL,
    "SourceType" TEXT NOT NULL,
    "Status" TEXT NOT NULL,
    "RiskLevel" TEXT NOT NULL,
    "RiskScore" INTEGER NOT NULL,
    "DeviceCount" INTEGER NOT NULL,
    "ConnectedUserCount" INTEGER NOT NULL,
    "HighRiskDeviceCount" INTEGER NOT NULL,
    "MediumRiskDeviceCount" INTEGER NOT NULL,
    "LowRiskDeviceCount" INTEGER NOT NULL,
    "ObservedAtUtc" TEXT NOT NULL,
    "WindowStartUtc" TEXT NULL,
    "WindowEndUtc" TEXT NULL,
    "Notes" TEXT NOT NULL,
    "PayloadJson" TEXT NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL
, "CampusKey" TEXT NOT NULL DEFAULT '', "MlScoredDeviceCount" INTEGER NOT NULL DEFAULT 0, RunNumber INTEGER NULL);
CREATE TABLE "RoomGeometryOverrides" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_RoomGeometryOverrides" PRIMARY KEY,
    "RoomExternalId" TEXT NOT NULL,
    "BuildingExternalId" TEXT NOT NULL,
    "GeometryJson" TEXT NOT NULL,
    "CentroidLatitude" REAL NULL,
    "CentroidLongitude" REAL NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL
);
CREATE TABLE "ScheduledScanRuns" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_ScheduledScanRuns" PRIMARY KEY,
    "ScheduledAtUtc" TEXT NOT NULL,
    "StartedAtUtc" TEXT NULL,
    "CompletedAtUtc" TEXT NULL,
    "Status" TEXT NOT NULL,
    "ErrorMessage" TEXT NULL,
    "SnapshotId" TEXT NULL,
    "ScheduledTimeLocal" TEXT NOT NULL,
    "ScheduledDayLocal" TEXT NOT NULL,
    "DeviceCount" INTEGER NULL,
    "UserCount" INTEGER NULL,
    "NormalizedCron" TEXT NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL, "CampusKey" TEXT NOT NULL DEFAULT '', "ScheduleLabel" TEXT NULL, "RunNumber" INTEGER NOT NULL DEFAULT 0,
    CONSTRAINT "FK_ScheduledScanRuns_NetworkTelemetrySnapshots_SnapshotId" FOREIGN KEY ("SnapshotId") REFERENCES "NetworkTelemetrySnapshots" ("Id") ON DELETE SET NULL
);
CREATE TABLE "SyncedBuildings" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_SyncedBuildings" PRIMARY KEY,
    "ExternalId" TEXT NOT NULL,
    "Campus" TEXT NOT NULL,
    "ManualCampus" TEXT NOT NULL,
    "Slug" TEXT NOT NULL,
    "DisplayName" TEXT NOT NULL,
    "ManualDisplayName" TEXT NOT NULL,
    "ShortName" TEXT NOT NULL,
    "RealName" TEXT NOT NULL,
    "Type" TEXT NOT NULL,
    "ResponsibleArea" TEXT NOT NULL,
    "Notes" TEXT NOT NULL,
    "SourceId" TEXT NOT NULL,
    "CentroidLatitude" REAL NULL,
    "CentroidLongitude" REAL NULL,
    "HasInteriorMap" INTEGER NOT NULL,
    "HasInventory" INTEGER NOT NULL,
    "MappingStatus" TEXT NOT NULL,
    "InventoryStatus" TEXT NOT NULL,
    "OperationalNotes" TEXT NOT NULL,
    "TechnicalNotes" TEXT NOT NULL,
    "LastUpdate" TEXT NOT NULL,
    "FloorsJson" TEXT NOT NULL,
    "ManualFloorsJson" TEXT NOT NULL,
    "FloorSummariesJson" TEXT NOT NULL,
    "TagsJson" TEXT NOT NULL,
    "ContactsJson" TEXT NOT NULL,
    "SyncedAtUtc" TEXT NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL
, IsDeleted INTEGER NOT NULL DEFAULT 0);
CREATE TABLE "SyncedEquipments" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_SyncedEquipments" PRIMARY KEY,
    "ExternalId" TEXT NOT NULL,
    "SyncedBuildingId" TEXT NOT NULL,
    "SyncedRoomId" TEXT NULL,
    "BuildingExternalId" TEXT NOT NULL,
    "RoomExternalId" TEXT NOT NULL,
    "Floor" INTEGER NULL,
    "Type" TEXT NOT NULL,
    "Subtype" TEXT NOT NULL,
    "Name" TEXT NOT NULL,
    "InventoryCode" TEXT NOT NULL,
    "SerialNumber" TEXT NOT NULL,
    "Brand" TEXT NOT NULL,
    "Model" TEXT NOT NULL,
    "IpAddress" TEXT NOT NULL,
    "MacAddress" TEXT NOT NULL,
    "AssignedTo" TEXT NOT NULL,
    "ResponsiblePerson" TEXT NOT NULL,
    "Status" TEXT NOT NULL,
    "NetworkStatus" TEXT NOT NULL,
    "LastSeen" TEXT NOT NULL,
    "PurchaseDate" TEXT NOT NULL,
    "Notes" TEXT NOT NULL,
    "HistoryJson" TEXT NOT NULL,
    "Source" TEXT NOT NULL,
    "SyncedAtUtc" TEXT NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL,
    CONSTRAINT "FK_SyncedEquipments_SyncedBuildings_SyncedBuildingId" FOREIGN KEY ("SyncedBuildingId") REFERENCES "SyncedBuildings" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_SyncedEquipments_SyncedRooms_SyncedRoomId" FOREIGN KEY ("SyncedRoomId") REFERENCES "SyncedRooms" ("Id") ON DELETE SET NULL
);
CREATE TABLE "SyncedRooms" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_SyncedRooms" PRIMARY KEY,
    "ExternalId" TEXT NOT NULL,
    "SyncedBuildingId" TEXT NOT NULL,
    "BuildingExternalId" TEXT NOT NULL,
    "Floor" INTEGER NOT NULL,
    "ManualFloor" INTEGER NULL,
    "Name" TEXT NOT NULL,
    "ManualName" TEXT NOT NULL,
    "ShortName" TEXT NOT NULL,
    "Type" TEXT NOT NULL,
    "Sector" TEXT NOT NULL,
    "Unit" TEXT NOT NULL,
    "Service" TEXT NOT NULL,
    "IsMapped" INTEGER NOT NULL,
    "GeometryJson" TEXT NOT NULL,
    "Status" TEXT NOT NULL,
    "Capacity" INTEGER NULL,
    "DevicesCount" INTEGER NOT NULL,
    "ResponsibleArea" TEXT NOT NULL,
    "ResponsiblePerson" TEXT NOT NULL,
    "Notes" TEXT NOT NULL,
    "SyncedAtUtc" TEXT NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL,
    CONSTRAINT "FK_SyncedRooms_SyncedBuildings_SyncedBuildingId" FOREIGN KEY ("SyncedBuildingId") REFERENCES "SyncedBuildings" ("Id") ON DELETE CASCADE
);
CREATE TABLE "TelemetryScanSchedules" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_TelemetryScanSchedules" PRIMARY KEY,
    "Label" TEXT NOT NULL,
    "Cron" TEXT NOT NULL,
    "TimeZone" TEXT NOT NULL,
    "CampusKey" TEXT NOT NULL,
    "IsEnabled" INTEGER NOT NULL,
    "SortOrder" INTEGER NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL
);
CREATE TABLE "WalkingRouteEdges" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_WalkingRouteEdges" PRIMARY KEY,
    "ExternalId" TEXT NOT NULL,
    "Campus" TEXT NOT NULL,
    "FromNodeExternalId" TEXT NOT NULL,
    "ToNodeExternalId" TEXT NOT NULL,
    "DistanceMeters" REAL NOT NULL,
    "Status" TEXT NOT NULL,
    "Notes" TEXT NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL
);
CREATE TABLE "WalkingRouteNodes" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_WalkingRouteNodes" PRIMARY KEY,
    "ExternalId" TEXT NOT NULL,
    "Campus" TEXT NOT NULL,
    "Latitude" REAL NOT NULL,
    "Longitude" REAL NOT NULL,
    "Notes" TEXT NOT NULL,
    "CreatedAtUtc" TEXT NOT NULL,
    "UpdatedAtUtc" TEXT NOT NULL,
    "DeletedAtUtc" TEXT NULL,
    "CreatedBy" TEXT NOT NULL,
    "UpdatedBy" TEXT NOT NULL,
    "DeletedBy" TEXT NOT NULL,
    "Version" INTEGER NOT NULL,
    "IsActive" INTEGER NOT NULL
);
CREATE TABLE "__EFMigrationsHistory" (
    "MigrationId" TEXT NOT NULL CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY,
    "ProductVersion" TEXT NOT NULL
);
CREATE INDEX "IX_AuditLogEntries_BuildingExternalId_CreatedAtUtc" ON "AuditLogEntries" ("BuildingExternalId", "CreatedAtUtc");
CREATE UNIQUE INDEX "IX_AuthUsers_NormalizedUsername" ON "AuthUsers" ("NormalizedUsername");
CREATE INDEX "IX_BackupHistories_CreatedAtUtc" ON "BackupHistories" ("CreatedAtUtc");
CREATE UNIQUE INDEX "IX_BuildingGeometryOverrides_BuildingExternalId" ON "BuildingGeometryOverrides" ("BuildingExternalId") WHERE "BuildingExternalId" IS NOT NULL AND "DeletedAtUtc" IS NULL;
CREATE INDEX "IX_Equipments_LocationId" ON "Equipments" ("LocationId");
CREATE INDEX "IX_ImportedInventoryItems_AssignedBuildingExternalId" ON "ImportedInventoryItems" ("AssignedBuildingExternalId");
CREATE INDEX "IX_ImportedInventoryItems_AssignedRoomExternalId" ON "ImportedInventoryItems" ("AssignedRoomExternalId");
CREATE UNIQUE INDEX "IX_ImportedInventoryItems_SourceFile_RowNumber" ON "ImportedInventoryItems" ("SourceFile", "RowNumber") WHERE "DeletedAtUtc" IS NULL;
CREATE UNIQUE INDEX "IX_InventoryAliasRules_NormalizedSourceText" ON "InventoryAliasRules" ("NormalizedSourceText") WHERE "NormalizedSourceText" IS NOT NULL AND "DeletedAtUtc" IS NULL;
CREATE INDEX "IX_InventoryDocuments_InventoryItemId" ON "InventoryDocuments" ("InventoryItemId");
CREATE UNIQUE INDEX "IX_ManualBuildings_ExternalId" ON "ManualBuildings" ("ExternalId");
CREATE INDEX "IX_ManualRooms_BuildingExternalId_Floor" ON "ManualRooms" ("BuildingExternalId", "Floor");
CREATE UNIQUE INDEX "IX_ManualRooms_ExternalId" ON "ManualRooms" ("ExternalId");
CREATE INDEX IX_MapMarkers_BuildingExternalId_Floor
ON MapMarkers (BuildingExternalId, Floor);
CREATE UNIQUE INDEX IX_MapMarkers_ExternalId
ON MapMarkers (ExternalId);
CREATE INDEX "IX_MlTrainingRuns_ModelType_CreatedAtUtc" ON "MlTrainingRuns" ("ModelType", "CreatedAtUtc");
CREATE INDEX "IX_NetworkTelemetryObservations_IpAddress" ON "NetworkTelemetryObservations" ("IpAddress");
CREATE INDEX "IX_NetworkTelemetryObservations_MacAddress" ON "NetworkTelemetryObservations" ("MacAddress");
CREATE INDEX "IX_NetworkTelemetryObservations_NetworkTelemetrySnapshotId" ON "NetworkTelemetryObservations" ("NetworkTelemetrySnapshotId");
CREATE INDEX "IX_NetworkTelemetryObservations_ObservationType_RiskLevel" ON "NetworkTelemetryObservations" ("ObservationType", "RiskLevel");
CREATE INDEX "IX_NetworkTelemetryObservations_ObservedAtUtc" ON "NetworkTelemetryObservations" ("ObservedAtUtc");
CREATE INDEX "IX_NetworkTelemetryObservations_SerialNumber" ON "NetworkTelemetryObservations" ("SerialNumber");
CREATE INDEX "IX_NetworkTelemetryObservations_SubnetCidr" ON "NetworkTelemetryObservations" ("SubnetCidr");
CREATE INDEX "IX_NetworkTelemetryObservations_Username" ON "NetworkTelemetryObservations" ("Username");
CREATE INDEX "IX_NetworkTelemetrySnapshots_CampusKey" ON "NetworkTelemetrySnapshots" ("CampusKey");
CREATE INDEX "IX_NetworkTelemetrySnapshots_ObservedAtUtc" ON "NetworkTelemetrySnapshots" ("ObservedAtUtc");
CREATE INDEX "IX_NetworkTelemetrySnapshots_SourceName_ObservedAtUtc" ON "NetworkTelemetrySnapshots" ("SourceName", "ObservedAtUtc");
CREATE UNIQUE INDEX "IX_RoomGeometryOverrides_RoomExternalId" ON "RoomGeometryOverrides" ("RoomExternalId") WHERE "RoomExternalId" IS NOT NULL AND "DeletedAtUtc" IS NULL;
CREATE INDEX "IX_ScheduledScanRuns_ScheduledAtUtc" ON "ScheduledScanRuns" ("ScheduledAtUtc");
CREATE INDEX "IX_ScheduledScanRuns_SnapshotId" ON "ScheduledScanRuns" ("SnapshotId");
CREATE INDEX "IX_ScheduledScanRuns_Status" ON "ScheduledScanRuns" ("Status");
CREATE UNIQUE INDEX "IX_SyncedBuildings_ExternalId" ON "SyncedBuildings" ("ExternalId");
CREATE INDEX "IX_SyncedEquipments_BuildingExternalId" ON "SyncedEquipments" ("BuildingExternalId");
CREATE UNIQUE INDEX "IX_SyncedEquipments_ExternalId" ON "SyncedEquipments" ("ExternalId");
CREATE INDEX "IX_SyncedEquipments_RoomExternalId" ON "SyncedEquipments" ("RoomExternalId");
CREATE INDEX "IX_SyncedEquipments_SyncedBuildingId" ON "SyncedEquipments" ("SyncedBuildingId");
CREATE INDEX "IX_SyncedEquipments_SyncedRoomId" ON "SyncedEquipments" ("SyncedRoomId");
CREATE UNIQUE INDEX "IX_SyncedRooms_ExternalId" ON "SyncedRooms" ("ExternalId");
CREATE INDEX "IX_SyncedRooms_SyncedBuildingId_Floor" ON "SyncedRooms" ("SyncedBuildingId", "Floor");
CREATE INDEX "IX_TelemetryScanSchedules_IsEnabled" ON "TelemetryScanSchedules" ("IsEnabled");
CREATE INDEX "IX_WalkingRouteEdges_Campus" ON "WalkingRouteEdges" ("Campus");
CREATE UNIQUE INDEX "IX_WalkingRouteEdges_ExternalId" ON "WalkingRouteEdges" ("ExternalId") WHERE "ExternalId" IS NOT NULL AND "DeletedAtUtc" IS NULL;
CREATE INDEX "IX_WalkingRouteEdges_FromNodeExternalId" ON "WalkingRouteEdges" ("FromNodeExternalId");
CREATE INDEX "IX_WalkingRouteEdges_ToNodeExternalId" ON "WalkingRouteEdges" ("ToNodeExternalId");
CREATE UNIQUE INDEX "IX_WalkingRouteNodes_ExternalId" ON "WalkingRouteNodes" ("ExternalId") WHERE "ExternalId" IS NOT NULL AND "DeletedAtUtc" IS NULL;
