Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp15551ywo;
        Tue, 23 Apr 2019 18:39:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwTmK/QgoNNhyXbBS7iosBJPX07UNPD0b5o/xPdcJuBlDetyrHVNTErOcIvHwslTVkdqTkc
X-Received: by 2002:a17:902:1602:: with SMTP id g2mr29429154plg.325.1556069958220;
        Tue, 23 Apr 2019 18:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556069958; cv=none;
        d=google.com; s=arc-20160816;
        b=IKk7oKrb9YwWQ/1OERPwY75aw7wAnuKkNlZjAbWeaBEKD+RL0gDPs6DS7fp3HCeL7w
         iT9KunQcqmP41VwcGInkwr1hTAKl/MDYIDdpGSu+5vspmzdafAjpf6Pj5jfw+xY9L8ey
         bUaXKLIyvTlUzcclzmeAQiGX/JQMDq/GnYl3GaeCXMmy48iUmQkwckqVeMy40HaIgjdB
         XDyNTliNb8uCutE0BP4s5u3zfeug/XLQLTNpcsapPCy2f86bHVDUsyUW9Q2mkU+5R7x2
         bm3t01bM4FciwkpXinv4Kt2ncTZbGfU9WBjVaNslFMD0GVCR7xMTv8IPPckq+kyMT+ok
         GluQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=p/f4Jph+D6rEK1DvEsDtUXC+9PxtWLV/rxvN+vpS4UE=;
        b=RsCR8TACJr3PvliEtVVK7lKyebGT1BNp/UmEBjPk7WdnmQPp5mRKavmMfwI+PjHYgm
         jmKy5VgR26MZ3rvSLZc1qbFtNr0wNcZy4whiiGXQ9n0U9ZDHUlYdxfFZHctotlVuZSjV
         uKln6ntkktZXx0ncwzJ8QpwNZqF8ziWroEiZjSlWPqFIqnlw9IGxSJYMeLEV6Qj41A5l
         c6twqpiXPCDtt3UnEPyMQT8l7vDFVfuJXjnqajYvT33eMoHZq8klaR+fWS5pRnFjo/oe
         wBXDlEMeYVD918rDhLSvoAtttGmBXR8MX7eWXI9hKBeWvGRp+OcAfVudgTPbbFFvYo1O
         lyWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id a13si16298295pgh.139.2019.04.23.18.39.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 18:39:18 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652BD89402;
	Wed, 24 Apr 2019 01:39:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF6189402
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 24 Apr 2019 01:39:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2019 18:39:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,387,1549958400"; d="scan'208";a="167334846"
Received: from tinazhang-linux-1.bj.intel.com ([10.238.158.97])
 by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2019 18:39:13 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: 
Subject: [PATCH] drm/i915/gvt: Remove logging when checking surface base
 address
Date: Wed, 24 Apr 2019 09:33:56 +0800
Message-Id: <1556069636-10440-1-git-send-email-tina.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com,
 Tina Zhang <tina.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlIHZncHUncyBwbGFuZSBzdXJmYWNlIGJhc2UgYWRkcmVzcyByZWdpc3RlciBjb3VsZCBjb250
YWluIGludmFsaWRhdGVkCnZhbHVlcy4gT25seSB2YWxpZGF0ZWQgdmFsdWVzIGNhbiBiZSB1c2Vk
IGJ5IEdWVC1nIGRpc3BsYXkgbW9kZWwuCkludmFsaWRhdGVkIHZhbHVlcyBzaG91bGQgYmUgaWdu
b3JlZCB3L28gY2F1c2luZyBhbnkgbm9pc2UuCgpDYzogWGlhb2xpbiBaaGFuZyA8eGlhb2xpbi56
aGFuZ0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFRpbmEgWmhhbmcgPHRpbmEuemhhbmdAaW50
ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9mYl9kZWNvZGVyLmMgfCA2ICsr
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZmJfZGVjb2Rlci5jIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2ZiX2RlY29kZXIuYwppbmRleCA2NWU4NDczLi4zNTY0YmM0IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZmJfZGVjb2Rlci5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9mYl9kZWNvZGVyLmMKQEAgLTI0NSw3ICsyNDUsNyBAQCBp
bnQgaW50ZWxfdmdwdV9kZWNvZGVfcHJpbWFyeV9wbGFuZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdw
dSwKIAlwbGFuZS0+aHdfZm9ybWF0ID0gZm10OwogCiAJcGxhbmUtPmJhc2UgPSB2Z3B1X3ZyZWdf
dCh2Z3B1LCBEU1BTVVJGKHBpcGUpKSAmIEk5MTVfR1RUX1BBR0VfTUFTSzsKLQlpZiAoIWludGVs
X2d2dF9nZ3R0X3ZhbGlkYXRlX3JhbmdlKHZncHUsIHBsYW5lLT5iYXNlLCAwKSkKKwlpZiAoIXBs
YW5lLT5iYXNlIHx8ICF2Z3B1X2dtYWRyX2lzX3ZhbGlkKHZncHUsIHBsYW5lLT5iYXNlKSkKIAkJ
cmV0dXJuICAtRUlOVkFMOwogCiAJcGxhbmUtPmJhc2VfZ3BhID0gaW50ZWxfdmdwdV9nbWFfdG9f
Z3BhKHZncHUtPmd0dC5nZ3R0X21tLCBwbGFuZS0+YmFzZSk7CkBAIC0zNjgsNyArMzY4LDcgQEAg
aW50IGludGVsX3ZncHVfZGVjb2RlX2N1cnNvcl9wbGFuZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdw
dSwKIAkJCWFscGhhX3BsYW5lLCBhbHBoYV9mb3JjZSk7CiAKIAlwbGFuZS0+YmFzZSA9IHZncHVf
dnJlZ190KHZncHUsIENVUkJBU0UocGlwZSkpICYgSTkxNV9HVFRfUEFHRV9NQVNLOwotCWlmICgh
aW50ZWxfZ3Z0X2dndHRfdmFsaWRhdGVfcmFuZ2UodmdwdSwgcGxhbmUtPmJhc2UsIDApKQorCWlm
ICghcGxhbmUtPmJhc2UgfHwgIXZncHVfZ21hZHJfaXNfdmFsaWQodmdwdSwgcGxhbmUtPmJhc2Up
KQogCQlyZXR1cm4gIC1FSU5WQUw7CiAKIAlwbGFuZS0+YmFzZV9ncGEgPSBpbnRlbF92Z3B1X2dt
YV90b19ncGEodmdwdS0+Z3R0LmdndHRfbW0sIHBsYW5lLT5iYXNlKTsKQEAgLTQ3Miw3ICs0NzIs
NyBAQCBpbnQgaW50ZWxfdmdwdV9kZWNvZGVfc3ByaXRlX3BsYW5lKHN0cnVjdCBpbnRlbF92Z3B1
ICp2Z3B1LAogCXBsYW5lLT5kcm1fZm9ybWF0ID0gZHJtX2Zvcm1hdDsKIAogCXBsYW5lLT5iYXNl
ID0gdmdwdV92cmVnX3QodmdwdSwgU1BSU1VSRihwaXBlKSkgJiBJOTE1X0dUVF9QQUdFX01BU0s7
Ci0JaWYgKCFpbnRlbF9ndnRfZ2d0dF92YWxpZGF0ZV9yYW5nZSh2Z3B1LCBwbGFuZS0+YmFzZSwg
MCkpCisJaWYgKCFwbGFuZS0+YmFzZSB8fCAhdmdwdV9nbWFkcl9pc192YWxpZCh2Z3B1LCBwbGFu
ZS0+YmFzZSkpCiAJCXJldHVybiAgLUVJTlZBTDsKIAogCXBsYW5lLT5iYXNlX2dwYSA9IGludGVs
X3ZncHVfZ21hX3RvX2dwYSh2Z3B1LT5ndHQuZ2d0dF9tbSwgcGxhbmUtPmJhc2UpOwotLSAKMi43
LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVs
LWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0
LWRldg==
