Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp153265ywo;
        Wed, 3 Apr 2019 05:16:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwx2oN27/eKCAwsnzE1ZAbpdesGpgOjMK/ySdOdZpO4Xd8xg7cVA5Vb4fU7k6ZbF76zHu4O
X-Received: by 2002:a65:6210:: with SMTP id d16mr22971842pgv.110.1554293799946;
        Wed, 03 Apr 2019 05:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554293799; cv=none;
        d=google.com; s=arc-20160816;
        b=NYGo+pn9ddeerxpXFSMTOJmuNQtThysLb2aBrkVUxp0Hie//GMziBhnNxjRHZIO6i/
         u0n/qYh32NfBjjSklKD5b4Oa5PG/ijLZKNz7eEW/ik/wrBRhT82ea9Y6Jo67zyn93vdD
         fanMQLvxCvWCUJoutlgoP4hVqcYYXjCF8ln5enywen3Lqd5IRnatlGAW9Tu3JbkeSpki
         ILV78imQwI9QAJGbpLDScv0fxj7iq51g/w8a8yO9Id0n6xG4p75Rsn5cno7vrL8ug3El
         YCA46StyoePvNDN5bqVGnpk/UaCczLau2E9ZOSbpWdIIzQQGPlKtp/4oiCvuOqGeEqAh
         Da2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:message-id:in-reply-to:to
         :from:subject:mime-version:delivered-to;
        bh=HcQpxaA0bqeImGAkC2DURk4gXFgEP6Afecwg7fO9NBk=;
        b=CLiswIGRsjAsJNzkAjcopkX2a3ound0u/2L7NcYJRsjfUb3AjSVxYmeoHe+WialFGx
         RffYvID/XUbMr34pga53utUNLmLZmu761mIFj4vHFU4FUC4sjjBnJEtQJfkYPa4LdfNJ
         Qy+GHckx7NNFWeUNV5fbGfDE2xsKqulyth2ERq32YAFeZedtHfP2FG93F/Vz4XcppjAn
         abKcjV22PlhazAPac+BYPcVktlVx3SShg4XO3n5kZZ8olHOpj0220uyCSl88wo0IKnFl
         s+AJ74IJ/TFiHbBrYmCnt02wPqZBM8KuxkqUoTZ35uH9CzBzAFqUThGQdL1oO+rXQLW9
         r9wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id e7si5542661pgc.307.2019.04.03.05.16.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2019 05:16:39 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9616E9AD;
	Wed,  3 Apr 2019 12:16:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CA96E9AD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Apr 2019 12:16:38 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Apr 2019 05:16:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,304,1549958400"; 
 d="log'?scan'208";a="158354717"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga004.fm.intel.com with ESMTP; 03 Apr 2019 05:16:36 -0700
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 3 Apr 2019 05:16:31 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 fmsmsx117.amr.corp.intel.com (10.18.116.17) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 3 Apr 2019 05:16:31 -0700
Received: from [127.0.1.1] (10.239.48.224) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 3 Apr 2019
 20:16:29 +0800
Content-Type: multipart/mixed; boundary="===============2464341898003487336=="
MIME-Version: 1.0
Subject: Jenkins Job Failed for Patch
 [PATCH_v3]_drm/i915/gvt:_addressed_guest_GPU_hang_with_HWS_index_mode
From: <lab_gvt-test@intel.com>
To: <intel-gvt-dev@lists.freedesktop.org>
In-Reply-To: <20190403053244.3487-1-xiaolin.zhang@intel.com>
Message-ID: <a662f3ae-85d7-4db2-a548-cc4b3655f883@shsmsx104.ccr.corp.intel.com>
Date: Wed, 3 Apr 2019 20:16:29 +0800
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

--===============2464341898003487336==
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
eHQtYWxpZ249ImNlbnRlciI+W1BBVENIX3YzXV9kcm0vaTkxNS9ndnQ6X2FkZHJlc3NlZF9ndWVz
dF9HUFVfaGFuZ193aXRoX0hXU19pbmRleF9tb2RlIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAg
ICAgIDx0ZD54aWFvbGluLnpoYW5nIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5i
dWlsZF9mYWlsdXJlIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5idWlsZCA8YSBo
cmVmPSJodHRwOi8vZ3Z0LWplbmtpbnMuc2guaW50ZWwuY29tOjgwODAvam9iL3BhdGNoLXRlc3Qt
a3ZtZ3QvNDE1L2NvbnNvbGUiPjQxNTwvYT48L3RkPgogICAgICAgICAgICAgICAgICAgIDwvdHI+
CiAgICAgICAgICAgICAgICA8L3RhYmxlPg==

--===============2464341898003487336==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="build.log"

W3BhdGNoLXRlc3Qta3ZtZ3RdIFJ1bm5pbmcgc2hlbGwgc2NyaXB0CisgZWNobyAjIyMjIyBzdGFy
dCB0byBjb25zdW1lIHBhdGNoIFtQQVRDSF92M11fZHJtL2k5MTUvZ3Z0Ol9hZGRyZXNzZWRfZ3Vl
c3RfR1BVX2hhbmdfd2l0aF9IV1NfaW5kZXhfbW9kZSAjIyMjIwojIyMjIyBzdGFydCB0byBjb25z
dW1lIHBhdGNoIFtQQVRDSF92M11fZHJtL2k5MTUvZ3Z0Ol9hZGRyZXNzZWRfZ3Vlc3RfR1BVX2hh
bmdfd2l0aF9IV1NfaW5kZXhfbW9kZSAjIyMjIwo=

--===============2464341898003487336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============2464341898003487336==--
