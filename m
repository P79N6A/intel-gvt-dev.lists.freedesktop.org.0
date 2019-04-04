Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp1107452ywo;
        Thu, 4 Apr 2019 00:17:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzD+abNDXmmiuwyrI5EdrKLOzLIyGEq4MN2hv/29KpAH5YW8J0K56/Q5lM6aTEc6KU6VXj8
X-Received: by 2002:a17:902:a607:: with SMTP id u7mr4850954plq.66.1554362237635;
        Thu, 04 Apr 2019 00:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554362237; cv=none;
        d=google.com; s=arc-20160816;
        b=pnUJOYsFZHQrCjclItdb/9ottC8b9b03nvxm/5ZOKie64zctOjNLcc/gfIbwV/pHxN
         J0oP0HnVfD7lr6WGIEbwrhOp3RVsgh2pyZITgd9YIGkEU1m+keerTiy9eu403OYGw7SF
         QmgswOFaR5WXgPoUE+T59+HeOxRTPxwmsNIAx2UEw8urdNJ4+oMiGSZD9WqGyKxVfh3X
         H9JoEVFoR1RvJabw/6TBFKkZ6XdxV+52IaND4XG7AR8waRAHm/0yQIzJ96AW/tvhgB6r
         wxAspgUP8u+rEGy3Mol3Sxb+u9p3l39s73TjPU2Y7NdAPLMAihl/NibS2ztViPCui5bQ
         Iydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:message-id:in-reply-to:to
         :from:subject:mime-version:delivered-to;
        bh=/1Xd5pTEjfTQjGQC+xVeK95jkDWVwjLGRKeWJyP8DE0=;
        b=KTH0kTsQ55A7k2jPiWHqyl5+Zznx5nkAHyBL+pw8aHdst8Br7a0bVxwDt11VVzh5mc
         KLFw8Lv2JqS5lDImfwQZNf83xUThdy27yDqJ40GuQ9Fjn2WJzQKEVPVtzj5Yf411N0Br
         uwtF6qKYFYLTqcKwL/VcKDEYwKzc/4k6OdnjNyCX9BgcroomqR3FTMdZye7C/BJGJW5h
         nhOL+ML/DTNHGiI5ZrsHceJp0ClUpTcpNkGRfJmd1kwzT6diHyeNYXHTpcdJWUZ4A+WK
         3/T2RkLE0YbrpvZp/7g0GyP3PNQSBT4KcdrTkC79XwytiKwHdkAjlnev91r1R/UxfQTl
         vquw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id q9si15506969pgq.173.2019.04.04.00.17.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2019 00:17:17 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEE46E562;
	Thu,  4 Apr 2019 07:17:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8C96E562
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  4 Apr 2019 07:17:15 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Apr 2019 00:17:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; 
 d="log'?scan'208";a="158631657"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga004.fm.intel.com with ESMTP; 04 Apr 2019 00:17:15 -0700
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 4 Apr 2019 00:17:15 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 FMSMSX154.amr.corp.intel.com (10.18.116.70) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 4 Apr 2019 00:17:14 -0700
Received: from [127.0.1.1] (10.239.48.224) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 4 Apr 2019
 15:17:13 +0800
Content-Type: multipart/mixed; boundary="===============2998467170290019035=="
MIME-Version: 1.0
Subject: Jenkins Job Failed for Patch
 [PATCH]_drm/i915/gvt:_Annotate_iomem_usage
From: <lab_gvt-test@intel.com>
To: <intel-gvt-dev@lists.freedesktop.org>
In-Reply-To: <20190404071425.25847-1-chris@chris-wilson.co.uk>
Message-ID: <3d3c9050-6c7a-4f01-8e02-6739145eee0a@shsmsx104.ccr.corp.intel.com>
Date: Thu, 4 Apr 2019 15:17:13 +0800
X-Originating-IP: [10.239.48.224]
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============2998467170290019035==
Content-Type: text/html; charset="uft-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

CiAgICAgICAgICAgICAgICA8dGFibGUgY29sb3I9IkNDQ0MzMyIgd2lkdGg9IjgwMCIgYm9yZGVy
PSIxIiBjZWxsc3BhY2luZz0iMCIgY2VsbHBhZGRpbmc9IjUiIHRleHQtYWxpZ249ImNlbnRlciI+
CiAgICAgICAgICAgICAgICAgICAgPHRyPgogICAgICAgICAgICAgICAgICAgICAgICA8dGQgc3R5
bGU9IndvcmQtd3JhcDpicmVhay13b3JkO3dvcmQtYnJlYWs6YnJlYWstYWxsOyIgd2lkdGg9IjEw
MHB4IiB0ZXh0LWFsaWduPSJjZW50ZXIiIGJnY29sb3I9ImxpZ2h0Ymx1ZSI+U3ViamVjdDo8L3Rk
PgogICAgICAgICAgICAgICAgICAgICAgICA8dGQgbm93cmFwPSJub3dyYXAiIHRleHQtYWxpZ249
ImNlbnRlciIgYmdjb2xvcj0ibGlnaHRibHVlIj5Pd25lcjo8L3RkPgogICAgICAgICAgICAgICAg
ICAgICAgICA8dGQgbm93cmFwPSJub3dyYXAiIHRleHQtYWxpZ249ImNlbnRlciIgYmdjb2xvcj0i
bGlnaHRibHVlIj48Zm9udCBjb2xvcj0ncmVkJz5FcnJvciBUeXBlOjwvZm9udD48L3RkPgogICAg
ICAgICAgICAgICAgICAgICAgICA8dGQgbm93cmFwPSJub3dyYXAiIHRleHQtYWxpZ249ImNlbnRl
ciIgYmdjb2xvcj0ibGlnaHRibHVlIj5Mb2c6PC90ZD4KICAgICAgICAgICAgICAgICAgICA8L3Ry
PgogICAgICAgICAgICAgICAgICAgIDx0cj4KICAgICAgICAgICAgICAgICAgICAgICAgPHRkIHRl
eHQtYWxpZ249ImNlbnRlciI+W1BBVENIXV9kcm0vaTkxNS9ndnQ6X0Fubm90YXRlX2lvbWVtX3Vz
YWdlIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5jaHJpcyA8L3RkPgogICAgICAg
ICAgICAgICAgICAgICAgICA8dGQ+YnVpbGRfZmFpbHVyZSA8L3RkPgogICAgICAgICAgICAgICAg
ICAgICAgICA8dGQ+YnVpbGQgPGEgaHJlZj0iaHR0cDovL2d2dC1qZW5raW5zLnNoLmludGVsLmNv
bTo4MDgwL2pvYi9wYXRjaC10ZXN0LWt2bWd0LzQxOS9jb25zb2xlIj40MTk8L2E+PC90ZD4KICAg
ICAgICAgICAgICAgICAgICA8L3RyPgogICAgICAgICAgICAgICAgPC90YWJsZT4=

--===============2998467170290019035==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="build.log"

W3BhdGNoLXRlc3Qta3ZtZ3RdIFJ1bm5pbmcgc2hlbGwgc2NyaXB0CisgZWNobyAjIyMjIyBzdGFy
dCB0byBjb25zdW1lIHBhdGNoIFtQQVRDSF1fZHJtL2k5MTUvZ3Z0Ol9Bbm5vdGF0ZV9pb21lbV91
c2FnZSAjIyMjIwojIyMjIyBzdGFydCB0byBjb25zdW1lIHBhdGNoIFtQQVRDSF1fZHJtL2k5MTUv
Z3Z0Ol9Bbm5vdGF0ZV9pb21lbV91c2FnZSAjIyMjIwo=

--===============2998467170290019035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============2998467170290019035==--
