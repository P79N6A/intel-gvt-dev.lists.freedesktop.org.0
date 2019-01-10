Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1782889ywd;
        Thu, 10 Jan 2019 05:19:36 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5+kJC8ApKDBlVE+n6lPD4japTpsR4bPvehEyslZtGeVTiEkg5ewYU/4dBdTR0VgUsBkkcW
X-Received: by 2002:a17:902:6b09:: with SMTP id o9mr10276017plk.208.1547126376020;
        Thu, 10 Jan 2019 05:19:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547126375; cv=none;
        d=google.com; s=arc-20160816;
        b=ihryur/MxvLkROuqJx9G2SyVWfnr0TYjQjsG018NOZTh/9IuknXnADpedHBJc6maMX
         2U/La8tvx7UPfMAA/XPpMGXMPqZC49AiZ9HcoF0Z5fcx6tAjSxRNSJEwhWvYeTmsdUXw
         /mPdMhLd5KZekRitRvUt2Lyp92qoB8qC8HMs3iS/sFQ1GLym/1uP5l921HB5Wa+KChgc
         ODp6Rwx7tCyySS0cmIxUocEPVTjOr46LGL3ePL+jUIdjGWQDJvDzTHpofoOG84ur+fj0
         byBEbtGnS5ZXXgTLULZyU9+1SokBQpI6vDGQG5upzMBXxtfnIFW8HRdUB6lpoMwxGCG1
         W4mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=ZRD8rzrGHz8z8aDjNRvcexarSizV2iqQV6ILLWm7ySA=;
        b=UIgT/EbnV0uv0py8+RDgwyHee/yNlpoaX5RJBFXOz5T7r20W0LXSAPkDcpUsEyIC4P
         sGeVODQ9dSdSjb6FRWCFh4qrXP510cdBiYe7nA+TDnTDt6+4Cmfs4RSpKA1Ajg6P2gJd
         mtUfKnMYJbx4MNzoPjUE2MsYgupOWbXnYUlHccAzEmgdi0bUxLkQV6I/9VZfmdztE+lc
         O0eLzdLzgXsJoHLOxbZLB+J4504HjRVNGFLDdfUBOeXeC/UjjuLGvltsw/NCr+5mH1Wg
         mMxtjTzk0NDPVD0/kOsYko9tsfaLLHg0J5DCvnfsfgG9Lzy2aM0rBnqI1o6N2hmHVB6R
         c2gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id p26si3250053pfj.244.2019.01.10.05.19.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jan 2019 05:19:35 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EABA6E615;
	Thu, 10 Jan 2019 13:19:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D43C6E615
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Jan 2019 13:19:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DB2B9A0C2B;
 Thu, 10 Jan 2019 13:19:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-203.ams2.redhat.com
 [10.36.116.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EDB310A182A;
 Thu, 10 Jan 2019 13:19:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C9E02A213; Thu, 10 Jan 2019 14:19:32 +0100 (CET)
Date: Thu, 10 Jan 2019 14:19:32 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: hang.yuan@linux.intel.com
Subject: Re: [PATCH v1 0/4] drm/i915/gvt: add one VFIO graphics EDID region
Message-ID: <20190110131932.5gzlq6msbtnoy2gw@sirius.home.kraxel.org>
References: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 10 Jan 2019 13:19:33 +0000 (UTC)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCBKYW4gMTAsIDIwMTkgYXQgMDc6MDQ6NDRQTSArMDgwMCwgaGFuZy55dWFuQGxpbnV4
LmludGVsLmNvbSB3cm90ZToKPiBGcm9tOiBIYW5nIFl1YW4gPGhhbmcueXVhbkBsaW51eC5pbnRl
bC5jb20+Cj4gCj4gQ3JlYXRlIG9uZSBWRklPIGdyYXBoaWNzIEVESUQgcmVnaW9uIGZvciB2Z3B1
LiBXaGVuIHRoZSByZWdpb24gaXMgdXBkYXRlZCwKPiBob3RwbHVnIGV2ZW50IGlzIGVtdWxhdGVk
IGZvciBndWVzdCB0byBnZXQgbmV3IEVESUQgZGF0YS4KCldoYXQgYnJhbmNoIHRoaXMgc2VyaWVz
IGlzIGFnYWluc3Q/CkFwcGx5aW5nIHRvIDUuMC1yYzEgZG9lc24ndCB3b3JrIC4uLgoKY2hlZXJz
LAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldgo=
