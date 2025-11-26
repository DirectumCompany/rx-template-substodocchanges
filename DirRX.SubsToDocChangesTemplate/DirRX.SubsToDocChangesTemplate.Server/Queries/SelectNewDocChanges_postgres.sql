SELECT [HistoryDate]
      ,[User]
      ,[EntityId]
      ,[EntityType]
      ,[Action]
      ,[Operation]
      ,[OperationDet]
      ,[Comment]
      ,isnull([Operation], [OperationDet]) as ActionName
FROM Sungero_Content_DocHistory
WHERE 
  EntityType in ('{0}')
  and (
      (Action = 'Update' and Operation = 'CreateVersion' and VersionNumber > 1) or
      (Action = 'Update' and Operation = 'DeleteVersion') or
      (Action = 'ChangeRelation' and OperationDet = 'AddRelation') or
      (Action = 'ChangeRelation' and OperationDet = 'RemoveRelation') or
      (Action = 'Update' and Operation = 'EnOnApproval') or
      (Action = 'Update' and Operation = 'Registration') or
      (Action = 'Update' and Operation = 'Unregistration') or
      (Action = 'Sign' and OperationDet = 'Approve') or
      (Action = 'Update' and Operation = 'EnOnRework') or
      (Action = 'Update' and Operation = 'EnAborted') or
      (Action = 'Update' and OperationDet = 'EnReviewed') or
      (Action = 'Update' and OperationDet = 'ExOnExecution') or
      (Action = 'Update' and OperationDet = 'ExExecuted') or
      (Action = 'Update' and OperationDet = 'ExAborted') or
      (Action = 'Update' and OperationDet = 'CEOnApproval') or
      (Action = 'Update' and OperationDet = 'CESigned') or
      (Action = 'Update' and OperationDet = 'CEUnsigned') or
      (Action = 'Update' and OperationDet = 'TAChange')
      )
  and HistoryDate > @previousDate
  order by HistoryDate