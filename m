Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp1908484ywa;
        Sun, 17 Feb 2019 22:46:58 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaOm15LN7XA/6oV3o0D5tsk8ktHMpwmR51AzQnKUJjV8ZzLdcsyPBZNwhLZj5+hIAe+Rzoh
X-Received: by 2002:a62:5789:: with SMTP id i9mr22276342pfj.75.1550472418043;
        Sun, 17 Feb 2019 22:46:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550472418; cv=none;
        d=google.com; s=arc-20160816;
        b=YrsDH+RCCOftaipcfOzln8enfvc6g6rmDCmTVtqkcEK9VeDbviWgWX+ITY+v34aSoP
         ltyTqjVbfi3ie01nW3bAolmY5fVb9PQldJ+1VhftPjR+Jb730S746BcGwvaRwqUIUmw2
         qqhBrW4jUHh1OK/VzwS62zwfndabZy540NsYNN983YATP3EzQRxKCrSxQ+WMLLgXL/u0
         uwXgDa1/bJcW82d+/2Sm79R2rV6oidhmJYpWV/JWScVPmFWTId5wgJibthzrW5Xnmhc1
         DoUZAn8bUMdvPqJALHyzOy3N7ui8Xt/VPDFXWhYMq9ddMWYDHaRCp/s2TZ5KRG2QvH50
         Mmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=fCFMRPpPBfC+CQSxnvoMC9Hn9ya3S0hMMIsDizF83uY=;
        b=Md9PQlj8CXCLhrY/DlS/eQi8KhY21LeitIWVYYBpDNwrdFO31sLp5ndB3/kq76EuG/
         VqSv3XzTgtEeFboixoAXqeLo6/kFwmqYw+RUOjHqY0SHueTRxZrr9RVhrja5hUVCzhnx
         rspGnUAZJnbF58FQexFdDKhcQEyQGesqucYeoNA6E0qJPuTakfwcE/jsj5hObZftZZVv
         4oeiokY8sw5Ng/4hRQnSAnAoT1aOJkBTcFIOfQv83pjYikVUkJ/KxTnsCuUhGsIPCAFK
         nddipg/OIvLQR0OFGBg+y0hlzkptZi5+yojZEfN2yblpcCt7IPtNoNTOHuLFnfZB/UcU
         sJeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 91si13078221pla.89.2019.02.17.22.46.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Feb 2019 22:46:58 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A7989119;
	Mon, 18 Feb 2019 06:46:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E49589119
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Feb 2019 06:46:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Feb 2019 22:46:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,383,1544515200"; d="scan'208";a="321221415"
Received: from debian-skl.sh.intel.com ([10.239.13.15])
 by fmsmga005.fm.intel.com with ESMTP; 17 Feb 2019 22:46:53 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Fix MI_FLUSH_DW parsing with correct index check
Date: Mon, 18 Feb 2019 14:46:53 +0800
Message-Id: <20190218064653.26020-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

V2hlbiBNSV9GTFVTSF9EVyBwb3N0IHdyaXRlIGh3IHN0YXR1cyBwYWdlIGluIGluZGV4IG1vZGUs
IHRoZSBpbmRleAp2YWx1ZSBpcyBpbiBkd29yZCBzdGVwLiBUaGlzIGZpeGVzIHdyb25nIHF3b3Jk
IHN0ZXAgaW4gY21kIHBhcnNlciBjb2RlCndoaWNoIGluY29ycmVjdGx5IHN0b3BwZWQgVk0gZm9y
IGludmFsaWQgTUlfRkxVU0hfRFcgd3JpdGUgaW5kZXguCgpGaXhlczogYmUxZGE3MDcwYWVhICgi
ZHJtL2k5MTUvZ3Z0OiB2R1BVIGNvbW1hbmQgc2Nhbm5lciIpCkNjOiBzdGFibGVAdmdlci5rZXJu
ZWwub3JnICMgdjQuMTArClNpZ25lZC1vZmYtYnk6IFpoZW55dSBXYW5nIDx6aGVueXV3QGxpbnV4
LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKaW5kZXggMzViNGVjM2Y3NjE4Li5kNDJmN2Ey
ZGM4MmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwpAQCAtMTQ0MSw3ICsx
NDQxLDcgQEAgc3RhdGljIGlubGluZSBpbnQgY21kX2FkZHJlc3NfYXVkaXQoc3RydWN0IHBhcnNl
cl9leGVjX3N0YXRlICpzLAogCX0KIAogCWlmIChpbmRleF9tb2RlKQl7Ci0JCWlmIChndWVzdF9n
bWEgPj0gSTkxNV9HVFRfUEFHRV9TSVpFIC8gc2l6ZW9mKHU2NCkpIHsKKwkJaWYgKGd1ZXN0X2dt
YSA+PSBJOTE1X0dUVF9QQUdFX1NJWkUgLyBzaXplb2YodTMyKSkgewogCQkJcmV0ID0gLUVGQVVM
VDsKIAkJCWdvdG8gZXJyOwogCQl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVs
LWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
