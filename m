Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp1045891ywe;
        Thu, 21 Feb 2019 21:33:19 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib8XRxufE+xCnvyCe8Kc1sBpNrVyb8mTMzFJUi02nu9aQHkuARGOnXlSpteEbdBG1QGuo0Y
X-Received: by 2002:a62:ea09:: with SMTP id t9mr2532461pfh.228.1550813599060;
        Thu, 21 Feb 2019 21:33:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550813599; cv=none;
        d=google.com; s=arc-20160816;
        b=CHyN/t/RFGQK5SEe9qo4fcWi26h8MtNDXv+zhQYVOXYcuWd2Une70mR9f/1VduTWTI
         h4rcju//YB3Ag4ZXH6lC5nfVpMb6K3QL+jw5j6r04gZCDLILkTkmov8PlaDQJ0JjauDS
         ThlwT2nKS9ynnbA00dHtr2S6NBJsz6rr3tlJwRCJ1Dpmbd9l3x4IuLHU669wj2rihrZ4
         eFLYK7eSbzRznrfUbWPRnYgWDvIfxzJggbln2vdWj0cpROHtTg0EgOWtwd7fUcq6ChaT
         VP3FlicJC5iCa0NhfUQa8DipT7GFmS08EX0vZ17R0BBewcqiVPnmdJcBxeTPf2HjxVK7
         HB6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=OQ0AXKNtQD3uZviD+KZN7JIBU8eYSlK1yE9D3/tut08=;
        b=NzgxTUDZIxMBNatVABXnNSHoI9/WwsbvnUJs1DIVn16+FFRrOA3EUo5LhZJVzlvsDC
         yL/AS3WDQUvupMNKqzkib4jrB9QGOVb2gVu0CQOszetjo+t7hOgVX21Oz38B+iLFsk0r
         rmXbYPf6b3eW2Jdwo6LEDxTUAN3D5XQPWsWz6kUAaTsMB2nR/2z9fM3bb7MLqzcVu5Lr
         X30eJQuRBvNf9DIQoBng4kk4Quv0SybWvZj+IgCnNDl5DFWeFTcbkg6SBX4TtFo6w/7/
         lZHcz0c0emP3z12bGjsVaXwpiK9538JavEjdfQLijgxaMIWnwUH4tE18oZECZ2Egd4B4
         88Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id j127si548855pgc.444.2019.02.21.21.33.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Feb 2019 21:33:19 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A753D89225;
	Fri, 22 Feb 2019 05:33:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD6689225
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Feb 2019 05:33:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2019 21:33:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,398,1544515200"; d="scan'208";a="136293001"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.22])
 by orsmga002.jf.intel.com with ESMTP; 21 Feb 2019 21:33:15 -0800
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Add in context mmio 0x20D8 to gen9 mmio list
Date: Fri, 22 Feb 2019 13:33:09 +0800
Message-Id: <20190222053309.17115-1-colin.xu@intel.com>
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RGVwZW5kcyBvbiBHRU4gZmFtaWx5IGFuZCBJOTE1X1BBUkFNX0hBU19DT05URVhUX0lTT0xBVElP
TiwgTWVzYSBkcml2ZXIKd2lsbCBkZWNpZGUgd2hldGhlciBjb25zdGFudCBidWZmZXIgMCBhZGRy
ZXNzIGlzIHJlbGF0aXZlIG9yIGFic29sdXRlLAphbmQgbG9hZCBHUFUgaW5pdGlhbCBzdGF0ZSBi
eSBscmkgdG8gY29udGV4dCBtbWlvIElOU1RQTSAoR0VOOCkKb3IgMHgyMEQ4ICg+PUdFTjkpLgpN
ZXNhIENvbW1pdCBmYThhNzY0YjYyCigiaTk2NTogVXNlIGFic29sdXRlIGFkZHJlc3NpbmcgZm9y
IGNvbnN0YW50IGJ1ZmZlciAwIG9uIEtlcm5lbCA0LjE2Ky4iKQoKSU5TVFBNIGlzIGFscmVhZHkg
YWRkZWQgdG8gZ2VuOF9lbmdpbmVfbW1pb19saXN0LCBidXQgMHgyMEQ4IGlzIG1pc3NlZAppbiBn
ZW45X2VuZ2luZV9tbWlvX2xpc3QuIEZyb20gR1ZUIHBvaW50IG9mIHZpZXcsIGRpZmZlcmVudCBn
dWVzdCBjb3VsZApoYXZlIGRpZmZlcmVudCBjb250ZXh0IHNvIHNob3VsZCBzd2l0Y2ggdGhvc2Ug
bW1pbyBhY2NvcmRpbmdseS4KClNpZ25lZC1vZmYtYnk6IENvbGluIFh1IDxjb2xpbi54dUBpbnRl
bC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4dC5jIHwgMSAr
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
bW1pb19jb250ZXh0LmMKaW5kZXggN2Q4NGNmYjkwNTFhLi43OTAyZmIxNjJkMDkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2NvbnRleHQuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmMKQEAgLTEzMiw2ICsxMzIsNyBAQCBzdGF0
aWMgc3RydWN0IGVuZ2luZV9tbWlvIGdlbjlfZW5naW5lX21taW9fbGlzdFtdIF9fY2FjaGVsaW5l
X2FsaWduZWQgPSB7CiAKIAl7UkNTLCBHRU45X0dBTVRfRUNPX1JFR19SV19JQSwgMHgwLCBmYWxz
ZX0sIC8qIDB4NGFiMCAqLwogCXtSQ1MsIEdFTjlfQ1NGRV9DSElDS0VOMV9SQ1MsIDB4ZmZmZiwg
ZmFsc2V9LCAvKiAweDIwZDQgKi8KKwl7UkNTLCBfTU1JTygweDIwRDgpLCAweGZmZmYsIHRydWV9
LCAvKiAweDIwZDggKi8KIAogCXtSQ1MsIEdFTjhfR0FSQkNOVEwsIDB4MCwgZmFsc2V9LCAvKiAw
eGIwMDQgKi8KIAl7UkNTLCBHRU43X0ZGX1RIUkVBRF9NT0RFLCAweDAsIGZhbHNlfSwgLyogMHgy
MGEwICovCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaW50ZWwtZ3Z0LWRldg==
