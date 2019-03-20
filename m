Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp212965ywb;
        Tue, 19 Mar 2019 20:21:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxJFJxY2S28TLx34WAEj6P0tvfIOBmoJhBWdeLdHpW2xzWBzlFMPfAiZWbrLIMcOFbXu61D
X-Received: by 2002:a62:b517:: with SMTP id y23mr5263833pfe.144.1553052113776;
        Tue, 19 Mar 2019 20:21:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553052113; cv=none;
        d=google.com; s=arc-20160816;
        b=BCOgJN//yjEALoCUUvUxS1iPuc5CtuziVB0I/T1orQlcB9hYejwL7v5d1uBilpKqOz
         MQru9qUR4k1h/d12k0h8TCRJW5dYd9ZEE+VwmYqM6HFY4u86aequG8ag9OO9wmHtufnv
         78+C7MeIAqgDun7Fp8WBOA8FWhva2RiqsA8qxuTG8l9tiOFQ+yH6izFX7hmtTVjlohUX
         KEfnKSZCBfrXtIOQX0fEEtIslKUN2TJO0v2pycfLh/F6d9GFE+aRhp3GjQXqeN38G73J
         kRfHf2sIjldj2BXRIrgWsSoMBZRcFjbSYHReLsTZJk/QqPUD/uq+Wg6HBE59NLTWXEzt
         4dLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:date
         :subject:to:from:delivered-to;
        bh=geUKh4kC58vhf6mThYxwqD0n57ge0TlOhLixTiOPT0Y=;
        b=m+e9NbWJ6rZ9YAh0x3o1DyYMAOawfCRG/JwYqjRdicKoJVn41ZGu7WbrGmiCN77VUH
         jtIkNcQpL4XE4wVYzBNayL1pZWf+2pODJjbCyPwHK0D1v7VlwYFr9wimlS514BeMqzWR
         g5wsin0K0xIVjHsQaRTYVg9+iSMf5tO3x3og1vvpyybXGEYHviEgoQb+k/rT4/OuZwkA
         zJ3Qxj1y6U8/Zw77sbkS+fgH49Oeiej1FZJj5/FlrvqlhIYkX/khrgiGmvT0MQny1ZKS
         MpV2T8fP8A2v5SYpwmYyxdcEg/p0Bavnt5IJcp0CmX3gsgwYD1LZ6q4x2A/omScZAlIT
         1L+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id v30si251251pgk.409.2019.03.19.20.21.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2019 20:21:53 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6235B89861;
	Wed, 20 Mar 2019 03:21:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AFE89861
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Mar 2019 03:21:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2019 20:21:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,246,1549958400"; d="scan'208";a="215707339"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.25])
 by orsmga001.jf.intel.com with ESMTP; 19 Mar 2019 20:21:50 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/6] drm/i915/gvt: Prevent invalid array index access to
 vgpu->fence.regs[]
Date: Wed, 20 Mar 2019 11:21:25 +0800
Message-Id: <20190320032130.9817-2-colin.xu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190320032130.9817-1-colin.xu@intel.com>
References: <20190320032130.9817-1-colin.xu@intel.com>
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

SW52YWxpZCBpbmRleCBjb3VsZCByZXN1bHQgaW4gYXJyYXkgb3ZlcmZsb3cgc28gbGltaXQgaXQg
dG8gYXJyYXkgc2l6ZS4KQWx0aG91Z2ggdGhlc2UgYWNjZXNzIGFyZSBwcm90ZWN0ZWQgYnkgY3Vy
cmVudCBndnQgbG9naWMgYW5kIHdvbid0IGhpdApkdXJpbmcgcnVubmluZywgYnV0IHN0aWxsIGhh
cyBwb3RlbnRpYWwgc2VjdXJpdHkgcmlzayBpbiBmdXR1cmUuCgpTaWduZWQtb2ZmLWJ5OiBDb2xp
biBYdSA8Y29saW4ueHVAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9h
cGVydHVyZV9nbS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvYXBlcnR1
cmVfZ20uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9hcGVydHVyZV9nbS5jCmluZGV4IDFm
YTJmNjVjM2NkMS4uZWMxNGQ3NTA2MTE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvYXBlcnR1cmVfZ20uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvYXBlcnR1
cmVfZ20uYwpAQCAtMTMzLDcgKzEzMyw4IEBAIHZvaWQgaW50ZWxfdmdwdV93cml0ZV9mZW5jZShz
dHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwKIAogCWFzc2VydF9ycG1fd2FrZWxvY2tfaGVsZChkZXZf
cHJpdik7CiAKLQlpZiAoV0FSTl9PTihmZW5jZSA+PSB2Z3B1X2ZlbmNlX3N6KHZncHUpKSkKKwlp
ZiAoV0FSTl9PTihmZW5jZSA+PSB2Z3B1X2ZlbmNlX3N6KHZncHUpIHx8CisJCSAgICBmZW5jZSA+
PSBJTlRFTF9HVlRfTUFYX05VTV9GRU5DRVMpKQogCQlyZXR1cm47CiAKIAlyZWcgPSB2Z3B1LT5m
ZW5jZS5yZWdzW2ZlbmNlXTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
