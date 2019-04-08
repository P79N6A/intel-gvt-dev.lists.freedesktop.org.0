Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3043512ywo;
        Sun, 7 Apr 2019 23:19:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxcIDPUIcxyzV7QY3Kq8t5zaf6y8qB8mQWek6ZwCvOAyDSy1DTF69HwH44jcvdaEPagPaPt
X-Received: by 2002:a63:ff18:: with SMTP id k24mr26124445pgi.140.1554704379485;
        Sun, 07 Apr 2019 23:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554704379; cv=none;
        d=google.com; s=arc-20160816;
        b=JCp66rxpt7VQfFiIn2IKizEJPpkEoxYtdtdE+eifAmFA+XgYgW/ncaDZ+Sj2MI+Vrt
         49ueEAprgHJtEoSPwYkM/RAXCkDnDKD+G7dbWRBdQp6PMEeaLnJkVQIaD/OmzgjZHNUt
         q5TB8dIT0gE5gjkD3pasMLT0UeQP+/KuXE6k9tFxuT9OYloE73RI7TNlhh4xd8oye+7z
         f7by3mRB4MQzQntt6k+iz5r45DftDKuM0RCLyIXtzymffIKBm3WraYuCTthl9mXnAXKc
         7lriyop9Mt1jUoieIBJT7k//FJ+aJvbV5nPeU78NoYD6zOz+4il5PnA9IS+J9R0aWvRr
         IOnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:message-id:in-reply-to:to
         :from:subject:mime-version:delivered-to;
        bh=tT/Glrdo+bw9gCVAysA1cAwea4pMEcSLElPtcah4BHw=;
        b=Iu199nkMv4wdRfSMQI2UUVcVH4wXlNZ0pfPhSD1HGQnj2K3JWfpMca9PtfO6swwAp8
         JdyWHRZso/OijugyjzCHJCa90gO7aL3RCfQdBBORTCBYYycpwSL/O4rATQ2esC53rX1g
         F9Wzl3oWDPCec9vLqreUsVNkmTRthfPTsSn99ZZ+HtbTBTpLdr748FF5PV8fXdD464Xh
         MkraCqnHLt1KirRy3/BJQPFSMVrLNerSR68vcYvZMMeS8Wnigfg7NdEjfum+hXlKxMf4
         wAb0RPZ+TIG5dT5nQDQHJ0Lg++iZHNYNr8dthhM18NbMJB511Strjmo9Yf1xPmfConBZ
         Uudg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id h125si25919017pgc.290.2019.04.07.23.19.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2019 23:19:39 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AB289235;
	Mon,  8 Apr 2019 06:19:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0D889235
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2019 06:19:36 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Apr 2019 23:19:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,324,1549958400"; 
 d="log'?scan'208";a="335863343"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga005.fm.intel.com with ESMTP; 07 Apr 2019 23:19:35 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 7 Apr 2019 23:19:35 -0700
Received: from [127.0.1.1] (10.239.48.224) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 8 Apr 2019
 14:19:33 +0800
Content-Type: multipart/mixed; boundary="===============7363507647574114411=="
MIME-Version: 1.0
Subject: Jenkins Job Failed for Patch
 [PATCH_1/5]_drm/i915/gvt:_Remove_typedef_intel_gvt_gtt_type_t
From: <lab_gvt-test@intel.com>
To: <intel-gvt-dev@lists.freedesktop.org>
In-Reply-To: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
Message-ID: <3381b0e8-9c55-47d9-a417-8c9e9b744417@shsmsx104.ccr.corp.intel.com>
Date: Mon, 8 Apr 2019 14:19:33 +0800
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

--===============7363507647574114411==
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
eHQtYWxpZ249ImNlbnRlciI+W1BBVENIXzEvNV1fZHJtL2k5MTUvZ3Z0Ol9SZW1vdmVfdHlwZWRl
Zl9pbnRlbF9ndnRfZ3R0X3R5cGVfdCA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICA8dGQ+
YWxla3NlaS5naW1iaXRza2lpIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5idWls
ZF9mYWlsdXJlIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5idWlsZCA8YSBocmVm
PSJodHRwOi8vZ3Z0LWplbmtpbnMuc2guaW50ZWwuY29tOjgwODAvam9iL3BhdGNoLXRlc3Qta3Zt
Z3QvNDIxL2NvbnNvbGUiPjQyMTwvYT48L3RkPgogICAgICAgICAgICAgICAgICAgIDwvdHI+CiAg
ICAgICAgICAgICAgICA8L3RhYmxlPg==

--===============7363507647574114411==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="build.log"

W3BhdGNoLXRlc3Qta3ZtZ3RdIFJ1bm5pbmcgc2hlbGwgc2NyaXB0CisgZWNobyAjIyMjIyBzdGFy
dCB0byBjb25zdW1lIHBhdGNoIFtQQVRDSF8xLzVdX2RybS9pOTE1L2d2dDpfUmVtb3ZlX3R5cGVk
ZWZfaW50ZWxfZ3Z0X2d0dF90eXBlX3QgIyMjIyMKIyMjIyMgc3RhcnQgdG8gY29uc3VtZSBwYXRj
aCBbUEFUQ0hfMS81XV9kcm0vaTkxNS9ndnQ6X1JlbW92ZV90eXBlZGVmX2ludGVsX2d2dF9ndHRf
dHlwZV90ICMjIyMjCg==

--===============7363507647574114411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============7363507647574114411==--
