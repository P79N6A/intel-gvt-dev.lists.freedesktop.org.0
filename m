Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp1038136ywo;
        Wed, 3 Apr 2019 22:46:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRmlyV3ItHfXPRPeaqQN8T3UWd8ry+M1byw4Kh0gHXHo48zRzhtJD0460Zhc0ue7Nzc+wc
X-Received: by 2002:a65:6259:: with SMTP id q25mr3928887pgv.103.1554356801704;
        Wed, 03 Apr 2019 22:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554356801; cv=none;
        d=google.com; s=arc-20160816;
        b=fHxrgy1wxTR68H/9KRcCBHz5sKosNhtFnFTO83vSgVMsDssBM3jhD7ypE/AfHPJDNE
         5lj6Di8LPIAQX0eGo6bB7rWRg4z68MUFYW3BMLtPcHuEXbynB9TTmfTEQRhntXT01tNp
         QuTkIndptcDwPqyJdjpRNfjZ2TE9O605OTfa3nAYItsKXZvHKJXTitWHRHSeA/Lg8h6Y
         Z7bG+Osn87211eHlWVC5Lj5Dmd5eZG804f3RmZf5lqyev+C4HPM6Dc55V22nRkK9H8c0
         NXQffbbMqaDcf4PY/+A2sU38Eo9wY5IvwJgzA1lhpafiH3k8BEhcPO9PHQaWFRPLXw5L
         9vlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:message-id:in-reply-to:to
         :from:subject:mime-version:delivered-to;
        bh=9KMdO2Wc1Ru8MjuW1DsdOQWk+qs5o7xOjaUT/+fRE2s=;
        b=l47qdoI6RdlGDddu+wOMmsWUe+aQXj9bEpqSTfVg1Wby/XO8ixp2X64MEI3s1Rp5gI
         v94knVhflyd0FNPzbqMsfRi4SWe1AMQ4tnqa5M2PYayJcBeqyXDFPYWI6lJ2hE2piOz6
         43Vh8Iz22B+80/5fdccGkzchcgu4Q2sn3GJFGPKpx0n1HKltRWCRija9EPtGNO936i85
         37ha+ilvhlr/OrrZG447+3taRyOk7/TZptiV8cQOjwuk0Bx64/yN1TGodFvc5MLvs2fm
         DzA5ktjuSUs1paSwHk/ZJL+JCNKY06x+wJ1wFfD2fZMYmZTIOjs0TX1BE4hvPshobgD8
         wMeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id t11si16197846pfa.110.2019.04.03.22.46.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2019 22:46:41 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E9D6E172;
	Thu,  4 Apr 2019 05:46:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47956E172
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  4 Apr 2019 05:46:39 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Apr 2019 22:46:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; 
 d="log'?scan'208";a="131333869"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga008.jf.intel.com with ESMTP; 03 Apr 2019 22:46:38 -0700
Received: from fmsmsx116.amr.corp.intel.com (10.18.116.20) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 3 Apr 2019 22:46:38 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 fmsmsx116.amr.corp.intel.com (10.18.116.20) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 3 Apr 2019 22:46:38 -0700
Received: from [127.0.1.1] (10.239.48.224) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 4 Apr 2019
 13:46:36 +0800
Content-Type: multipart/mixed; boundary="===============5473221546844062947=="
MIME-Version: 1.0
Subject: Jenkins Job Failed for Patch
 [PATCH_v5]_drm/i915/gvt:_addressed_guest_GPU_hang_with_HWS_index_mode
From: <lab_gvt-test@intel.com>
To: <intel-gvt-dev@lists.freedesktop.org>
In-Reply-To: <20190403080728.8140-1-xiaolin.zhang@intel.com>
Message-ID: <809b8cee-d762-4967-acfb-5053f2843c3d@shsmsx104.ccr.corp.intel.com>
Date: Thu, 4 Apr 2019 13:46:36 +0800
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

--===============5473221546844062947==
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
eHQtYWxpZ249ImNlbnRlciI+W1BBVENIX3Y1XV9kcm0vaTkxNS9ndnQ6X2FkZHJlc3NlZF9ndWVz
dF9HUFVfaGFuZ193aXRoX0hXU19pbmRleF9tb2RlIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAg
ICAgIDx0ZD54aWFvbGluLnpoYW5nIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5i
dWlsZF9mYWlsdXJlIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5idWlsZCA8YSBo
cmVmPSJodHRwOi8vZ3Z0LWplbmtpbnMuc2guaW50ZWwuY29tOjgwODAvam9iL3BhdGNoLXRlc3Qt
a3ZtZ3QvNDE4L2NvbnNvbGUiPjQxODwvYT48L3RkPgogICAgICAgICAgICAgICAgICAgIDwvdHI+
CiAgICAgICAgICAgICAgICA8L3RhYmxlPg==

--===============5473221546844062947==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="build.log"

W3BhdGNoLXRlc3Qta3ZtZ3RdIFJ1bm5pbmcgc2hlbGwgc2NyaXB0CisgZWNobyAjIyMjIyBzdGFy
dCB0byBjb25zdW1lIHBhdGNoIFtQQVRDSF92NV1fZHJtL2k5MTUvZ3Z0Ol9hZGRyZXNzZWRfZ3Vl
c3RfR1BVX2hhbmdfd2l0aF9IV1NfaW5kZXhfbW9kZSAjIyMjIwojIyMjIyBzdGFydCB0byBjb25z
dW1lIHBhdGNoIFtQQVRDSF92NV1fZHJtL2k5MTUvZ3Z0Ol9hZGRyZXNzZWRfZ3Vlc3RfR1BVX2hh
bmdfd2l0aF9IV1NfaW5kZXhfbW9kZSAjIyMjIwo=

--===============5473221546844062947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============5473221546844062947==--
