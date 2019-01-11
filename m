Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2617072ywd;
        Thu, 10 Jan 2019 22:26:00 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7H3BSNDdb7bgw4HfrESo2zIVsJkYonrlRo2uJYOP9o+LM9CRvJbeRXbtToDHPE9KjYB6lC
X-Received: by 2002:a63:a401:: with SMTP id c1mr2167334pgf.403.1547187960485;
        Thu, 10 Jan 2019 22:26:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547187960; cv=none;
        d=google.com; s=arc-20160816;
        b=JA5ZZ/bH+g/RshEC75MehaioKxDLklSQO7ddhZQn4ScICPk+qLvzQF/uQSTM7ENEl/
         qSeQDOfoagIZm7/fXKNy6FRlALcIw1DZC+W0/kfrXrWnOeUhdBp/ukEm1mEvXdOayYlX
         /GdmK2t6SZNl1zwa89ETaIvSzeRcLdqwFj+b0mxitFYZFXMRn4jlJPivZOWBZtI9M734
         c6QrmpN1SK/tQlfxKByqHFUjMHwZvLankbRe581eO535vyCW9p/VWLPuoP+X3hx9vE9n
         9Ka1kGyd2nxs7WRgXKhui3gfo+KARcCdOKSnNU/84aqMYAZXK6+h7aBzoWiPP4EsS8xc
         TTng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=54acr1nBQkWXr0cPy0USJ2fBFEaIFSN5mjcQ+aMy/Ig=;
        b=Pl5uuMNI5JOPUp4ORVsflkqOjYCCiKiKC47MyZza5tCrLYUpamRnt9IlOomNMQRjVh
         eHZewFmH011Tn3vNhaQ3fsy1ydjFBxLgGwNGSuiljREaqzzPNehgW5gWDICSO1J02gjs
         hrM5lKXl/GuwunnkzBVKXmYsPfQ0nTUiH/p/29t+hvQp7JkH9HmVB5HGJQwYYS6MWtEN
         M2L+TN59trXfx3nevhb6cRZ8doQXDTv6hPELMJU0v8kuAIwyhA3yh8buJoibL3bONFF1
         YHu978DBydJzUU1605RJmomvO6w7b/Vg8wBvAnOqZp3V6TnxN0q1ffGErafTXdgbA3z7
         sArA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id d14si29324386pgi.158.2019.01.10.22.25.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jan 2019 22:26:00 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46316E114;
	Fri, 11 Jan 2019 06:25:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12936E114
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Jan 2019 06:25:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2019 22:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,464,1539673200"; d="scan'208";a="266301951"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.22])
 by orsmga004.jf.intel.com with ESMTP; 10 Jan 2019 22:25:56 -0800
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Allow F_CMD_ACCESS on mmio 0x21f0
Date: Fri, 11 Jan 2019 14:25:54 +0800
Message-Id: <20190111062554.16409-1-colin.xu@intel.com>
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

VGhlIG5ld2x5IHVwZGF0ZWQgZ3Vlc3QgZHJpdmVyIGNvdWxkIHByb2dyYW0gMHgyMWYwIHZpYSBs
cmkgYW5kIHNybSwKd2l0aG91dCBGX0NNRF9BQ0NFU1MgZmxhZyBjbWQgcGFyc2VyIHdpbGwgc3Rv
cCBwYXJzZXIgcmVzZXQgY21kLgoweDIxZjAgYXBwbGllcyB0byBCRFcsIFNLTCwgS0JMLCBCWFQg
YW5kIENGTC4KClNpZ25lZC1vZmYtYnk6IENvbGluIFh1IDxjb2xpbi54dUBpbnRlbC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9oYW5kbGVycy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKaW5kZXgg
NjhhNjJiYTViZjU0Li5hNGI5NjU5MDE3ZmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9oYW5kbGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVy
cy5jCkBAIC0yNzk5LDYgKzI3OTksNyBAQCBzdGF0aWMgaW50IGluaXRfYnJvYWR3ZWxsX21taW9f
aW5mbyhzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpCiAJTU1JT19ERkgoX01NSU8oMHhlMmEwKSwgRF9C
RFdfUExVUywgRl9DTURfQUNDRVNTLCBOVUxMLCBOVUxMKTsKIAlNTUlPX0RGSChfTU1JTygweGUy
YjApLCBEX0JEV19QTFVTLCBGX0NNRF9BQ0NFU1MsIE5VTEwsIE5VTEwpOwogCU1NSU9fREZIKF9N
TUlPKDB4ZTJjMCksIERfQkRXX1BMVVMsIEZfQ01EX0FDQ0VTUywgTlVMTCwgTlVMTCk7CisJTU1J
T19ERkgoX01NSU8oMHgyMWYwKSwgRF9CRFdfUExVUywgRl9DTURfQUNDRVNTLCBOVUxMLCBOVUxM
KTsKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1n
dnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
