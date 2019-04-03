Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp154792ywo;
        Wed, 3 Apr 2019 05:18:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyM2qYMKEXggO1QdEledfkIiZdKSk/cp9mfsMVWmp7WLI99rlVLVKaGcLAsdV/QsyoIAnuC
X-Received: by 2002:a63:f212:: with SMTP id v18mr49545881pgh.231.1554293893365;
        Wed, 03 Apr 2019 05:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554293893; cv=none;
        d=google.com; s=arc-20160816;
        b=WCy8Hyhf+7tPyq4xU+5t9IM4B385ECD4AIf1adGyx3TCzwTFt4bKCJA6JMR//mNcKB
         RBbgnpzTba//cv+EqWUKaoKzxhwFlnasEy8RS0daXX0mr6yzvM1BRwYq8vQogNLikbpV
         gnfojeNHVv78v2TrrVFjZP3qRC1oxgomHwRkmpB4cO+bip0FACsnLqvg3xhpyqQKOiS5
         0ZS/Nv48kf39HFUO2bFZPQpqwO1QSzVJk/Ji7dC5f2eGEzSiEoejhwSFurRTbSafGFvF
         e3IklJE/YDmxC0McA+PAcZyxJSCzV/OFdx0UUzZJniHga0OhbcYS2/wCBAVROJXwBzAk
         6VVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:message-id:in-reply-to:to
         :from:subject:mime-version:delivered-to;
        bh=zMONfg6g3GprPyFuwCE7nSTBlWG6u4YbnjBzPY7oXVo=;
        b=wwmPItk0C/ooJ1dLQNIuJWarsgIRZsdUqX5yJKQ7Xhyo6taxviHw8b5iS3Uu6Kt5cx
         KpcJUmuyJpyFGKODyJCppRNmaCEFGBCm2DXgxsZKdosjg4Z8Hq0X6huSZf0kjdMicmYg
         J0/ceHUAyQicFy0TIVxpQ3HYkCTF6Pikg3QgihgjbhPqwquptj0hjYUeSMJwd+oiHEqW
         3YcdF5Hvn4zipmTOHi9dgqfdkXMyk8qYdVWtXUGLRdpSJLu2Ui5ijly2sflhnuPjgl7X
         +AHsILkfTmR6Qy/0fVMW9N/D/kZqmjdayriRfQS/G5bA10DSQRkcjQof7YHlRBacpwXF
         Yj6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id r11si6805947pgp.337.2019.04.03.05.18.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2019 05:18:13 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6A66E9AE;
	Wed,  3 Apr 2019 12:18:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3462E6E9AE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Apr 2019 12:18:11 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Apr 2019 05:18:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,304,1549958400"; 
 d="log'?scan'208";a="334613575"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga005.fm.intel.com with ESMTP; 03 Apr 2019 05:18:10 -0700
Received: from FMSMSX110.amr.corp.intel.com (10.18.116.10) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 3 Apr 2019 05:18:09 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 fmsmsx110.amr.corp.intel.com (10.18.116.10) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 3 Apr 2019 05:18:09 -0700
Received: from [127.0.1.1] (10.239.48.224) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 3 Apr 2019
 20:18:08 +0800
Content-Type: multipart/mixed; boundary="===============1033187419803668709=="
MIME-Version: 1.0
Subject: Jenkins Job Failed for Patch
 [PATCH_v4]_drm/i915/gvt:_addressed_guest_GPU_hang_with_HWS_index_mode
From: <lab_gvt-test@intel.com>
To: <intel-gvt-dev@lists.freedesktop.org>
In-Reply-To: <20190403070439.10595-1-xiaolin.zhang@intel.com>
Message-ID: <81ec5d2a-b649-4eef-b28b-62935c170621@shsmsx104.ccr.corp.intel.com>
Date: Wed, 3 Apr 2019 20:18:08 +0800
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

--===============1033187419803668709==
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
eHQtYWxpZ249ImNlbnRlciI+W1BBVENIX3Y0XV9kcm0vaTkxNS9ndnQ6X2FkZHJlc3NlZF9ndWVz
dF9HUFVfaGFuZ193aXRoX0hXU19pbmRleF9tb2RlIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAg
ICAgIDx0ZD54aWFvbGluLnpoYW5nIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5i
dWlsZF9mYWlsdXJlIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5idWlsZCA8YSBo
cmVmPSJodHRwOi8vZ3Z0LWplbmtpbnMuc2guaW50ZWwuY29tOjgwODAvam9iL3BhdGNoLXRlc3Qt
a3ZtZ3QvNDE2L2NvbnNvbGUiPjQxNjwvYT48L3RkPgogICAgICAgICAgICAgICAgICAgIDwvdHI+
CiAgICAgICAgICAgICAgICA8L3RhYmxlPg==

--===============1033187419803668709==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="build.log"

W3BhdGNoLXRlc3Qta3ZtZ3RdIFJ1bm5pbmcgc2hlbGwgc2NyaXB0CisgZWNobyAjIyMjIyBzdGFy
dCB0byBjb25zdW1lIHBhdGNoIFtQQVRDSF92NF1fZHJtL2k5MTUvZ3Z0Ol9hZGRyZXNzZWRfZ3Vl
c3RfR1BVX2hhbmdfd2l0aF9IV1NfaW5kZXhfbW9kZSAjIyMjIwojIyMjIyBzdGFydCB0byBjb25z
dW1lIHBhdGNoIFtQQVRDSF92NF1fZHJtL2k5MTUvZ3Z0Ol9hZGRyZXNzZWRfZ3Vlc3RfR1BVX2hh
bmdfd2l0aF9IV1NfaW5kZXhfbW9kZSAjIyMjIwo=

--===============1033187419803668709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1033187419803668709==--
