Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp156553ywo;
        Wed, 3 Apr 2019 05:19:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQBkO5qDhunnuQF5QPWaw2NC+8gsF4W6Y6zqHPd5kAyVvmzIkepxIvObeQCULFPFp+jU5M
X-Received: by 2002:a17:902:9a4c:: with SMTP id x12mr4295392plv.157.1554293996949;
        Wed, 03 Apr 2019 05:19:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554293996; cv=none;
        d=google.com; s=arc-20160816;
        b=B5Gf5w8OX5j7OCPCLuzOUrLtgMLeJaKDm0aWX4pskcniOxftP3OO+cOuXCbRUWutrf
         x8ljwf48jT8rrRf5RkvMO895MqehUWwdldAO0aIwqhGayJXafegC9QnbPcd/mm9tLtpK
         9GAc4eaxT2sdSTnXU0ZoBFmhVJTgjDkXo5pEVFO/jFQxJ2Wd0Q4VWgaAfmY2Op6wxolG
         nQIENbATlscbW9qsE9vCkR3Z/zCQcI9l0RXRpMzOUkOOvhrxOgyVVjIJAWg/Yvhp2kkU
         6f2Ydj4KwlfQQtHsevqI1vNtYdnXjtgMpaZO1Mt+v3QU4m68ib6AEdgk6x32gYwGLNXG
         lQwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:message-id:in-reply-to:to
         :from:subject:mime-version:delivered-to;
        bh=ufNgFNwMnLW//xOeao600s2gaiQ7P6eNKRu3dXOUGK0=;
        b=aqfb7bjsALr5vAJhLLHHqN63tZp0PbaSCNIToeQjlBnep3tK0OKc2X4L3YfuV/a4l3
         o0vlO7cD4JLfp9vebUHHnIlaA9hh268MrOMu5TQsK9/O1KBRCEp2FuwOK1dFFxZZ4Es4
         uLwOz5cCler7xx32sFlNatupDQtZHMK9MG+/gTvi65FrRlmS5u24w+dqnL5pomQY1EXG
         409wiBlXrbFK0gV4bXe7vowJd3weww+Uz7KotsWwjJnqZ0pdgcWvtdY8CueubHiuAVDQ
         j1e8nWP+OERyd8xDVOKRnjx2dMHmnzvNdEn0nDN5trfubVDvQmJ0pqsZIisVZeCKZbQm
         W0sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id k12si10168154plt.28.2019.04.03.05.19.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2019 05:19:56 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E73E6E8D4;
	Wed,  3 Apr 2019 12:19:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6108A6E8D4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Apr 2019 12:19:55 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Apr 2019 05:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,304,1549958400"; 
 d="log'?scan'208";a="288336005"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga004.jf.intel.com with ESMTP; 03 Apr 2019 05:19:54 -0700
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 3 Apr 2019 05:19:54 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 FMSMSX114.amr.corp.intel.com (10.18.116.8) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 3 Apr 2019 05:19:53 -0700
Received: from [127.0.1.1] (10.239.48.224) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 3 Apr 2019
 20:19:52 +0800
Content-Type: multipart/mixed; boundary="===============0666107595449929469=="
MIME-Version: 1.0
Subject: Jenkins Job Failed for Patch
 [PATCH_v5]_drm/i915/gvt:_addressed_guest_GPU_hang_with_HWS_index_mode
From: <lab_gvt-test@intel.com>
To: <intel-gvt-dev@lists.freedesktop.org>
In-Reply-To: <20190403080728.8140-1-xiaolin.zhang@intel.com>
Message-ID: <a9cc3ad9-4b52-467e-86e3-5cc14f312d3c@shsmsx104.ccr.corp.intel.com>
Date: Wed, 3 Apr 2019 20:19:52 +0800
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

--===============0666107595449929469==
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
a3ZtZ3QvNDE3L2NvbnNvbGUiPjQxNzwvYT48L3RkPgogICAgICAgICAgICAgICAgICAgIDwvdHI+
CiAgICAgICAgICAgICAgICA8L3RhYmxlPg==

--===============0666107595449929469==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="build.log"

W3BhdGNoLXRlc3Qta3ZtZ3RdIFJ1bm5pbmcgc2hlbGwgc2NyaXB0CisgZWNobyAjIyMjIyBzdGFy
dCB0byBjb25zdW1lIHBhdGNoIFtQQVRDSF92NV1fZHJtL2k5MTUvZ3Z0Ol9hZGRyZXNzZWRfZ3Vl
c3RfR1BVX2hhbmdfd2l0aF9IV1NfaW5kZXhfbW9kZSAjIyMjIwojIyMjIyBzdGFydCB0byBjb25z
dW1lIHBhdGNoIFtQQVRDSF92NV1fZHJtL2k5MTUvZ3Z0Ol9hZGRyZXNzZWRfZ3Vlc3RfR1BVX2hh
bmdfd2l0aF9IV1NfaW5kZXhfbW9kZSAjIyMjIwo=

--===============0666107595449929469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0666107595449929469==--
