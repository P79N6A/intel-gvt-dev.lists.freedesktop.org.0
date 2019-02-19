Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp3019425ywa;
        Mon, 18 Feb 2019 23:29:58 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZBLGaaI7aUWhaR7d4KXoX3tEzrl+ezON7ynSdiOhRlYlj7FFhuEOsGqx5BkKYWZMfwe32K
X-Received: by 2002:a17:902:64:: with SMTP id 91mr30383181pla.229.1550561398753;
        Mon, 18 Feb 2019 23:29:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550561398; cv=none;
        d=google.com; s=arc-20160816;
        b=j2xK+fPlgzvyBmSeDNh8xQO2wpKWXGlDEKZVMdh6Knx/pl9bJXNFh9ZcLghYMzbUd6
         SMnjyEhEUkripGqytq3T3bDHv4c5JmECmIIHZxJ6iLzej91jgGmQj0wuuc3DWddiaXiQ
         XYrqM28JRkkvEzSb3B4aI6FxfbWEShmP8UEXKvTUIXjw9vG4v6RBKChperSpwsUNhAWp
         L+yDRi79tTztGcbOmWmbOSd7CylZd/rGhuYRuWRtwqnntofFg27KGBrMzpD65594O2Pr
         XfA/6aLhblEXGw10VC8rMZ1AQjj5x65hjJobSglVCjS9b+WGiF7OJpPNFyvkva18gf0x
         mRLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=b2xFABpbTEwahT1SvL5RvSNRbZ6vIVdUOaq6bRxPD5k=;
        b=SwtmBSmCY3rSxMqk8qvzeZq2yiKquuHnnBLew1k6BfsN766u3zohHAaxzR8BunfY04
         n+UjBmRna8B8woulfbobZB316bZ+5imaRetxQZ7jlSWXonB1/jScGAubkB1WDbrS9L0G
         MjSBLetgzwhPTU9ox0u9u19Vs3+hsfTa+FLlrIRgxl2Vx+8nuJaJrNbehyVvfvI6uJTo
         xTdhMTLizFicj8OpiwlokcF+iRnM5I2AdcEiRpi9oHfIKA6BpLKEIq19NfIc17cAeCfq
         z/kg6h9AG6YqM1pYurAGA4d/vYMaYH/UmwpPwi/ya0Qd0vaaq/ifOH1wSZyR+Pk9dw4X
         RC0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id w4si10595036plp.141.2019.02.18.23.29.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 23:29:58 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602C589242;
	Tue, 19 Feb 2019 07:29:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3CC89242
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Feb 2019 07:29:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2019 23:29:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,387,1544515200"; d="scan'208";a="276083366"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by orsmga004.jf.intel.com with ESMTP; 18 Feb 2019 23:29:55 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	alex.williamson@redhat.com
Subject: [PATCH 5/8] drm/i915/gvt: Align the guest gm aperture start offset
 for live migration
Date: Tue, 19 Feb 2019 02:24:39 -0500
Message-Id: <20190219072439.13781-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219071914.13424-1-yan.y.zhao@intel.com>
References: <20190219071914.13424-1-yan.y.zhao@intel.com>
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
Cc: Yulei Zhang <yulei.zhang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RnJvbTogWXVsZWkgWmhhbmcgPHl1bGVpLnpoYW5nQGludGVsLmNvbT4KCkFzIGd1ZXN0IGdtIGFw
ZXJ0dXJlIHJlZ2lvbiBzdGFydCBvZmZzZXQgaXMgaW5pdGlhbGl6ZWQgd2hlbiB2R1BVIGNyZWF0
ZWQsCmluIG9yZGVyIHRvIG1ha2Ugc3VyZSB0aGF0IHN0YXJ0IG9mZnNldCBpcyByZW1haW4gdGhl
IHNhbWUgYWZ0ZXIgbWlncmF0aW9uLAphbGlnbiB0aGUgYXBlcnR1cmUgc3RhcnQgb2Zmc2V0IHRv
IDAgZm9yIGd1ZXN0LgoKU2lnbmVkLW9mZi1ieTogWXVsZWkgWmhhbmcgPHl1bGVpLnpoYW5nQGlu
dGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jIHwgIDMgKy0tCiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jICB8IDEwICsrKysrKysrLS0KIDIgZmlsZXMgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2
bWd0LmMKaW5kZXggYzEwNzIxNDNkYTFkLi4yMjNjNjdlODc2ODAgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9rdm1ndC5jCkBAIC0xMTk4LDggKzExOTgsNyBAQCBzdGF0aWMgbG9uZyBpbnRlbF92Z3B1X2lv
Y3RsKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdW5zaWduZWQgaW50IGNtZCwKIAkJCXNwYXJz
ZS0+aGVhZGVyLnZlcnNpb24gPSAxOwogCQkJc3BhcnNlLT5ucl9hcmVhcyA9IG5yX2FyZWFzOwog
CQkJY2FwX3R5cGVfaWQgPSBWRklPX1JFR0lPTl9JTkZPX0NBUF9TUEFSU0VfTU1BUDsKLQkJCXNw
YXJzZS0+YXJlYXNbMF0ub2Zmc2V0ID0KLQkJCQkJUEFHRV9BTElHTih2Z3B1X2FwZXJ0dXJlX29m
ZnNldCh2Z3B1KSk7CisJCQlzcGFyc2UtPmFyZWFzWzBdLm9mZnNldCA9IDA7CiAJCQlzcGFyc2Ut
PmFyZWFzWzBdLnNpemUgPSB2Z3B1X2FwZXJ0dXJlX3N6KHZncHUpOwogCQkJYnJlYWs7CiAKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvdmdwdS5jCmluZGV4IGM2MjhiZTA1ZmJmZS4uZmNjY2RhMzVhNDU2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC92Z3B1LmMKQEAgLTQ4LDggKzQ4LDcgQEAgdm9pZCBwb3B1bGF0ZV9wdmlu
Zm9fcGFnZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSkKIAl2Z3B1X3ZyZWdfdCh2Z3B1LCB2Z3Rp
Zl9yZWcodmd0X2NhcHMpKSB8PSBWR1RfQ0FQU19IV1NQX0VNVUxBVElPTjsKIAl2Z3B1X3ZyZWdf
dCh2Z3B1LCB2Z3RpZl9yZWcodmd0X2NhcHMpKSB8PSBWR1RfQ0FQU19IVUdFX0dUVDsKIAotCXZn
cHVfdnJlZ190KHZncHUsIHZndGlmX3JlZyhhdmFpbF9ycy5tYXBwYWJsZV9nbWFkci5iYXNlKSkg
PQotCQl2Z3B1X2FwZXJ0dXJlX2dtYWRyX2Jhc2UodmdwdSk7CisJdmdwdV92cmVnX3QodmdwdSwg
dmd0aWZfcmVnKGF2YWlsX3JzLm1hcHBhYmxlX2dtYWRyLmJhc2UpKSA9IDA7CiAJdmdwdV92cmVn
X3QodmdwdSwgdmd0aWZfcmVnKGF2YWlsX3JzLm1hcHBhYmxlX2dtYWRyLnNpemUpKSA9CiAJCXZn
cHVfYXBlcnR1cmVfc3oodmdwdSk7CiAJdmdwdV92cmVnX3QodmdwdSwgdmd0aWZfcmVnKGF2YWls
X3JzLm5vbm1hcHBhYmxlX2dtYWRyLmJhc2UpKSA9CkBAIC01MjQsNiArNTIzLDkgQEAgdm9pZCBp
bnRlbF9ndnRfcmVzZXRfdmdwdV9sb2NrZWQoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIGJvb2wg
ZG1sciwKIHsKIAlzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQgPSB2Z3B1LT5ndnQ7CiAJc3RydWN0IGlu
dGVsX2d2dF93b3JrbG9hZF9zY2hlZHVsZXIgKnNjaGVkdWxlciA9ICZndnQtPnNjaGVkdWxlcjsK
Kwl1NjQgbWFkZHIgPSB2Z3B1X3ZyZWdfdCh2Z3B1LCB2Z3RpZl9yZWcoYXZhaWxfcnMubWFwcGFi
bGVfZ21hZHIuYmFzZSkpOworCXU2NCB1bm1hZGRyID0gdmdwdV92cmVnX3QodmdwdSwKKwkJCQl2
Z3RpZl9yZWcoYXZhaWxfcnMubm9ubWFwcGFibGVfZ21hZHIuYmFzZSkpOwogCXVuc2lnbmVkIGlu
dCByZXNldHRpbmdfZW5nID0gZG1sciA/IEFMTF9FTkdJTkVTIDogZW5naW5lX21hc2s7CiAKIAln
dnRfZGJnX2NvcmUoIi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLVxu
Iik7CkBAIC01NTYsNiArNTU4LDEwIEBAIHZvaWQgaW50ZWxfZ3Z0X3Jlc2V0X3ZncHVfbG9ja2Vk
KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCBib29sIGRtbHIsCiAKIAkJaW50ZWxfdmdwdV9yZXNl
dF9tbWlvKHZncHUsIGRtbHIpOwogCQlwb3B1bGF0ZV9wdmluZm9fcGFnZSh2Z3B1KTsKKwkJdmdw
dV92cmVnX3QodmdwdSwgdmd0aWZfcmVnKGF2YWlsX3JzLm1hcHBhYmxlX2dtYWRyLmJhc2UpKSA9
CisJCQltYWRkcjsKKwkJdmdwdV92cmVnX3QodmdwdSwgdmd0aWZfcmVnKGF2YWlsX3JzLm5vbm1h
cHBhYmxlX2dtYWRyLmJhc2UpKSA9CisJCQl1bm1hZGRyOwogCQlpbnRlbF92Z3B1X3Jlc2V0X2Rp
c3BsYXkodmdwdSk7CiAKIAkJaWYgKGRtbHIpIHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxp
c3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
