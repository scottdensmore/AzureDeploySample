//===============================================================================
// Microsoft patterns & practices
// Windows Azure Architecture Guide
//===============================================================================
// Copyright © Microsoft Corporation.  All rights reserved.
// This code released under the terms of the 
// Microsoft patterns & practices license (http://wag.codeplex.com/license)
//===============================================================================


namespace Microsoft.Practices.WindowsAzure.MSBuildTasks
{
    using System;
    using Build.Framework;
    using Build.Utilities;

    public class GetDateTime : Task
    {
        DateTime dateTime;

        public GetDateTime()
        {
            Format = "g";
        }

        public string Format { get; set; }

        [Output]
        public string Text
        {
            get { return dateTime.ToString(Format); }
        }

        public bool Utc { get; set; }

        public override bool Execute()
        {
            dateTime = Utc ? DateTime.UtcNow : DateTime.Now;
            return true;
        }
    }
}