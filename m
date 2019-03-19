Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp3039835ywb;
        Mon, 18 Mar 2019 19:25:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwgSnTOpJmPm+oKgvR9J/5xLNYhj77WWSPhe0h38y0Gx+ZPh01FmyXaQn/8CYPTAbZqErEN
X-Received: by 2002:a17:902:7682:: with SMTP id m2mr81888pll.311.1552962327571;
        Mon, 18 Mar 2019 19:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552962327; cv=none;
        d=google.com; s=arc-20160816;
        b=H/Fnu2IiBEyouo+JVOAedvRUbwLFtI9hAd/RCohTwpZpcI9XeZjPF2POuGvDBm0van
         6X5xK7Kb0lP5pVNvCDRFqmolGCkAdhL8t+CFxixkypnbmdZ0M3sUrh2dylSEC1jXCtjT
         EAq+hbs9QwzI7ylmsf1H41imnASUZp+zd+NhPkoFq+7L7hx+UjN81vjjpt0ahs77boox
         LQui6jTubHqV80YaD2E034PTn/mCILucQGCsgqcox0McgNzJy6xG7teH8qQxBpalja2d
         N4fQAAvsXY4IhgxN4BpkXrhsRcuCd7Z3u5gx+kGMJMoB/krnGh/iiHqvEEBlvBSG0BiJ
         jd2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=mHNrHmkvYfa3LsyNMiTQqRBu2FrBbZTnXm1JdMhnwcw=;
        b=ucJRIQJ00ACt6taTdRdmjz3+eNjWWYfQCIJ+mmLyo1D46HUST+/c8EqYQFxmQgpxzc
         HQw7GVxZf+o+cJoYkShmtnZ3VyoiZD2Xp9sscKmyL9viwCT57EVBtGGZjt8JAoWoolAo
         S/Ao5uL+Xf2B2lE4pUezR1uMIkh+hNmLA7zTVpK+IHlmmrC/GnmplJkb4uMhz4s50ap8
         1Dyg+qVWtRXrldcyfQFnXeMRS0yIRyjO4edERhWRiSr4STAIgdE/FfP1dqRuouoF2xnH
         TwWfsVI8LhNX23Q4my8gnYlynsd7YiQjTAgSVUPjij27OKU9kwCtNYTASyj5rldHwYQT
         it3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id g4si9712780pgs.579.2019.03.18.19.25.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2019 19:25:27 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3409689791;
	Tue, 19 Mar 2019 02:25:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97F589791
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Mar 2019 02:25:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Mar 2019 19:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,496,1544515200"; d="scan'208";a="152940090"
Received: from test-optiplex-7040.bj.intel.com ([10.238.154.166])
 by fmsmga002.fm.intel.com with ESMTP; 18 Mar 2019 19:25:26 -0700
From: Xiong Zhang <xiong.y.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/gvt: Change fb_info->size from pages to bytes
Date: Tue, 19 Mar 2019 10:28:45 +0800
Message-Id: <1552962525-3786-2-git-send-email-xiong.y.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552962525-3786-1-git-send-email-xiong.y.zhang@intel.com>
References: <1552962525-3786-1-git-send-email-xiong.y.zhang@intel.com>
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
Cc: Xiong Zhang <xiong.y.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ZmJfaW5mby0+c2l6ZSBpcyBpbiBwYWdlcywgYnV0IHNvbWUgZnVuY3Rpb24gbmVlZCBieXRlcyB3
aGVuIGl0CmlzIGEgcGFyYW1ldGVyLiBTdWNoIGFzOgphLiBpbnRlbF9ndnRfZ2d0dF92YWxpZGF0
ZV9yYW5nZSgpIGFjY29yZGluZyB0byBmdW5jdGlvbiBkZWZpbml0aW9uCmIuIHZmaW9fZGV2aWNl
X2dmeF9wbGFuZV9pbmZvLT5zaXplIGFjY29yZGluZyB0byB0aGUgY29tbWVudCBvZgogICBpdHMg
ZGVmaW5pdGlvbgoKVGhpcyBwYXRjaCBjaGFuZ2UgZmJfaW5mby0+c2l6ZSBpbnRvIGJ5dGVzLgoK
U2lnbmVkLW9mZi1ieTogWGlvbmcgWmhhbmcgPHhpb25nLnkuemhhbmdAaW50ZWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYyB8IDE2ICsrKysrKysrKystLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9kbWFidWYuYwppbmRleCA1ZDg4N2Y3Li45MGQyZWY2IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2RtYWJ1Zi5jCkBAIC00NSw2ICs0NSw3IEBAIHN0YXRpYyBpbnQgdmdwdV9nZW1fZ2V0
X3BhZ2VzKAogCWludCBpLCByZXQ7CiAJZ2VuOF9wdGVfdCBfX2lvbWVtICpndHRfZW50cmllczsK
IAlzdHJ1Y3QgaW50ZWxfdmdwdV9mYl9pbmZvICpmYl9pbmZvOworCXUzMiBwYWdlX251bTsKIAog
CWZiX2luZm8gPSAoc3RydWN0IGludGVsX3ZncHVfZmJfaW5mbyAqKW9iai0+Z3Z0X2luZm87CiAJ
aWYgKFdBUk5fT04oIWZiX2luZm8pKQpAQCAtNTQsMTQgKzU1LDE1IEBAIHN0YXRpYyBpbnQgdmdw
dV9nZW1fZ2V0X3BhZ2VzKAogCWlmICh1bmxpa2VseSghc3QpKQogCQlyZXR1cm4gLUVOT01FTTsK
IAotCXJldCA9IHNnX2FsbG9jX3RhYmxlKHN0LCBmYl9pbmZvLT5zaXplLCBHRlBfS0VSTkVMKTsK
KwlwYWdlX251bSA9IGZiX2luZm8tPnNpemUgPj4gUEFHRV9TSElGVDsKKwlyZXQgPSBzZ19hbGxv
Y190YWJsZShzdCwgcGFnZV9udW0sIEdGUF9LRVJORUwpOwogCWlmIChyZXQpIHsKIAkJa2ZyZWUo
c3QpOwogCQlyZXR1cm4gcmV0OwogCX0KIAlndHRfZW50cmllcyA9IChnZW44X3B0ZV90IF9faW9t
ZW0gKilkZXZfcHJpdi0+Z2d0dC5nc20gKwogCQkoZmJfaW5mby0+c3RhcnQgPj4gUEFHRV9TSElG
VCk7Ci0JZm9yX2VhY2hfc2coc3QtPnNnbCwgc2csIGZiX2luZm8tPnNpemUsIGkpIHsKKwlmb3Jf
ZWFjaF9zZyhzdC0+c2dsLCBzZywgcGFnZV9udW0sIGkpIHsKIAkJc2ctPm9mZnNldCA9IDA7CiAJ
CXNnLT5sZW5ndGggPSBQQUdFX1NJWkU7CiAJCXNnX2RtYV9hZGRyZXNzKHNnKSA9CkBAIC0xNTcs
OCArMTU5LDcgQEAgc3RhdGljIHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICp2Z3B1X2NyZWF0
ZV9nZW0oc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlpZiAob2JqID09IE5VTEwpCiAJCXJldHVy
biBOVUxMOwogCi0JZHJtX2dlbV9wcml2YXRlX29iamVjdF9pbml0KGRldiwgJm9iai0+YmFzZSwK
LQkJaW5mby0+c2l6ZSA8PCBQQUdFX1NISUZUKTsKKwlkcm1fZ2VtX3ByaXZhdGVfb2JqZWN0X2lu
aXQoZGV2LCAmb2JqLT5iYXNlLCBpbmZvLT5zaXplKTsKIAlpOTE1X2dlbV9vYmplY3RfaW5pdChv
YmosICZpbnRlbF92Z3B1X2dlbV9vcHMpOwogCiAJb2JqLT5yZWFkX2RvbWFpbnMgPSBJOTE1X0dF
TV9ET01BSU5fR1RUOwpAQCAtMjEwLDYgKzIxMSw3IEBAIHN0YXRpYyBpbnQgdmdwdV9nZXRfcGxh
bmVfaW5mbyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCXN0cnVjdCBpbnRlbF92Z3B1X3ByaW1h
cnlfcGxhbmVfZm9ybWF0IHA7CiAJc3RydWN0IGludGVsX3ZncHVfY3Vyc29yX3BsYW5lX2Zvcm1h
dCBjOwogCWludCByZXQ7CisJdTMyIHBhZ2VfbnVtOwogCiAJaWYgKHBsYW5lX2lkID09IERSTV9Q
TEFORV9UWVBFX1BSSU1BUlkpIHsKIAkJcmV0ID0gaW50ZWxfdmdwdV9kZWNvZGVfcHJpbWFyeV9w
bGFuZSh2Z3B1LCAmcCk7CkBAIC0yNjQsOCArMjY2LDEwIEBAIHN0YXRpYyBpbnQgdmdwdV9nZXRf
cGxhbmVfaW5mbyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlyZXR1cm4gLUVJTlZBTDsKIAl9
CiAKLQlpbmZvLT5zaXplID0gKGluZm8tPnN0cmlkZSAqIGluZm8tPmhlaWdodCArIFBBR0VfU0la
RSAtIDEpCisJLy8gYWxpZ24gdG8gcGFnZQorCXBhZ2VfbnVtID0gKGluZm8tPnN0cmlkZSAqIGlu
Zm8tPmhlaWdodCArIFBBR0VfU0laRSAtIDEpCiAJCSAgICAgID4+IFBBR0VfU0hJRlQ7CisJaW5m
by0+c2l6ZSA9IHBhZ2VfbnVtIDw8IFBBR0VfU0hJRlQ7CiAJaWYgKGluZm8tPnNpemUgPT0gMCkg
ewogCQlndnRfdmdwdV9lcnIoImZiIHNpemUgaXMgemVyb1xuIik7CiAJCXJldHVybiAtRUlOVkFM
OwpAQCAtMjc1LDcgKzI3OSw3IEBAIHN0YXRpYyBpbnQgdmdwdV9nZXRfcGxhbmVfaW5mbyhzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LAogCQlndnRfdmdwdV9lcnIoIk5vdCBhbGlnbmVkIGZiIGFkZHJl
c3M6MHglbGx4XG4iLCBpbmZvLT5zdGFydCk7CiAJCXJldHVybiAtRUZBVUxUOwogCX0KLQlpZiAo
KChpbmZvLT5zdGFydCA+PiBQQUdFX1NISUZUKSArIGluZm8tPnNpemUpID4KKwlpZiAoKChpbmZv
LT5zdGFydCA+PiBQQUdFX1NISUZUKSArIHBhZ2VfbnVtKSA+CiAJCWdndHRfdG90YWxfZW50cmll
cygmZGV2X3ByaXYtPmdndHQpKSB7CiAJCWd2dF92Z3B1X2VycigiSW52YWxpZCBHVFQgb2Zmc2V0
IG9yIHNpemVcbiIpOwogCQlyZXR1cm4gLUVGQVVMVDsKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcg
bGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
