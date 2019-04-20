Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp330200ywo;
        Sat, 20 Apr 2019 03:51:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEPGREH2EGohDMJIu+n2MxNbXOLx5ZJ4MeSMNp18zJ0fn1ZvnhRuN4rMQb/dmkJ9rOit5p
X-Received: by 2002:aa7:96c6:: with SMTP id h6mr8928067pfq.239.1555757475233;
        Sat, 20 Apr 2019 03:51:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555757475; cv=none;
        d=google.com; s=arc-20160816;
        b=lvNL5ytQeNMPlHsx9d78OVfqiX6uP5dldQew322EkkdKDJyXETeXwSsvKaM13rYTqU
         6F987kYa+sU0ApZ4nUJSL0Pd5/f2gZWAts7rlvOWVI2XdU8rsxjUd0QA0VaRt/WtBPrf
         BdmEKVCx8Um36E+uXPqrKGNRCuPblxy3OigyRfmcGw2DeD2oA5IhTraJ09yfMEBehtJz
         04T3JMpcgVCEnS5D0hT1qbmaTkn0H1cLr8zVSxLSZD2fAUwXgc/RNFR/F5aOPaQDJ1aR
         k3331Zq7yxPkv/8QQ3r5aXh2SWg8E+Aex5i0flpFwzyVx58bMd81UYnvh4z/4Avam0vy
         XmDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:delivered-to;
        bh=AdyxWtiwCgYnpMVy+4EnTsHUOCFxRzRJVSn+2syhgZE=;
        b=cTirZyLq8ZZ/IrBpO4m1gKkKSbtftE5rI/WGtRTSrwPyAA7k5N/ySU46VUGUMRVaKR
         FyQfEM8JqOiVScTTs4mY78pTiDta3uUQH40bakvczpKP3ifA7W+gd9eIuTyZExRqaN+f
         jbXaIqrtJPj4rYJSlL5Yi8gXlM2V9+z+fPa3vGPi4srtpWsPnGMkNJC5iSBfnT8BU7Zo
         /cgNU3SfUSEKdVzUi+RHKmsQ6EkfFN2stzvW3xWk7x2bKk9VS3+XJUA9jdHvHQUsj+MI
         O6ddvPMfk4MCKkWHB+cifhnnJV1x90b8LTzoGoDsDksc+y/YriHhk2gK7yAODs1ngTmU
         ZYkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id r10si7036100pgp.30.2019.04.20.03.51.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Apr 2019 03:51:15 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755ED88FDA;
	Sat, 20 Apr 2019 10:51:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C4388FA6;
 Sat, 20 Apr 2019 10:51:13 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id w20so4098704qka.7;
 Sat, 20 Apr 2019 03:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kaS+veCYE7ao8csQbi/ZAdwFn2xeuMRJDTxk7kh9MmQ=;
 b=XkGwD0449bAIDgEXQBZwSGMZJxh+ZyqEcdM66GGuGg+SaCWpmPyAHRC8V7XYfrNCw8
 COXtcGomLe1MEdM6MyOaWDbnQNQzyRoyXLM3bKcylEBQbRTmA46GCGpMwswPcEDfN5Dy
 zbTKPyhTE7hk1uYUMLPTl6WIsyBgemy2Q71YL8FLaoRp8OKc25cNU4AYXoOGumNDl3wO
 bPwQXQK6UANjYmyDaNc4DuMpNd6FVaOzNCUhSwt+LPxQWl3P4YtERAl2ow8CdRBJ4vY6
 fLg5bXqpbpPWrpIXHBz30jJUUdHITWz02nBeMmxrN8nbf4T5wvmwEsvd4dlaAeVb7aC9
 JjTg==
X-Gm-Message-State: APjAAAXyVw/fOvzRPCg0EnxWPjRF6r95kkFWIgraEQnvTB+2OtVi8ah9
 A80jT3UCa9xSsZeEgJMHCnri5vjy9AJ8TVLmD3c=
X-Received: by 2002:a37:6886:: with SMTP id d128mr907042qkc.158.1555757472269; 
 Sat, 20 Apr 2019 03:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190414091452.22275-1-shyam.saini@amarulasolutions.com>
 <C398B8C9-6A54-4590-AA88-58D514BAEB71@oracle.com>
In-Reply-To: <C398B8C9-6A54-4590-AA88-58D514BAEB71@oracle.com>
From: Shyam Saini <mayhs11saini@gmail.com>
Date: Sat, 20 Apr 2019 16:21:00 +0530
Message-ID: <CAOfkYf7vn7UnYzZDh9==agVu61sYyFWzvo6hQBt3KfaKrWC-6Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] include: linux: Regularise the use of FIELD_SIZEOF
 macro
To: William Kucharski <william.kucharski@oracle.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=kaS+veCYE7ao8csQbi/ZAdwFn2xeuMRJDTxk7kh9MmQ=;
 b=EwO+gArlEBVQK/nJT5vZKE02dfSFFoeHd/43vZOndrjFwkjrhjJgbW66CULGd/qp8M
 CAKK4/fa+yfKDft5ldNSlPt0B6rGPqndRHkFtb4MayLgZRwIeW+bjjxZxoS2RPm+NmrM
 5J8qu7sm0tvit9z1Ptm9VeGVZYEOilIUa4FqMFKftvJ8C1sr9isBTWCvBqkSLuRkQFnC
 /JfrzCUu4i4VMVxMXiNW5Pt1t1KcV3H7PonI7MF2Vn8rgAvwSZzAmsvqnBS5yxoNSCFk
 Cki0HCuHLWy/0V7zOngTErhlDLx+7wgLUrHt9aXGhXBRdZrcx1OCpXV7iZBdhZmXdUlW
 Hvng==
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
Cc: Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Network Development <netdev@vger.kernel.org>, intel-gfx@lists.freedesktop.org,
 devel@lists.orangefs.org, LKML <linux-kernel@vger.kernel.org>,
 Shyam Saini <shyam.saini@amarulasolutions.com>, linux-mips@vger.kernel.org,
 linux-mm <linux-mm@kvack.org>, linux-sctp@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, bpf <bpf@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SGkgV2lsbGlhbSwKClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4KCj4gPiBDdXJyZW50bHksIHRo
ZXJlIGFyZSAzIGRpZmZlcmVudCBtYWNyb3MsIG5hbWVseSBzaXplb2ZfZmllbGQsIFNJWkVPRl9G
SUVMRAo+ID4gYW5kIEZJRUxEX1NJWkVPRiB3aGljaCBhcmUgdXNlZCB0byBjYWxjdWxhdGUgdGhl
IHNpemUgb2YgYSBtZW1iZXIgb2YKPiA+IHN0cnVjdHVyZSwgc28gdG8gYnJpbmcgdW5pZm9ybWl0
eSBpbiBlbnRpcmUga2VybmVsIHNvdXJjZSB0cmVlIGxldHMgdXNlCj4gPiBGSUVMRF9TSVpFT0Yg
YW5kIHJlcGxhY2UgYWxsIG9jY3VycmVuY2VzIG9mIG90aGVyIHR3byBtYWNyb3Mgd2l0aCB0aGlz
Lgo+ID4KPiA+IEZvciB0aGlzIHB1cnBvc2UsIHJlZGVmaW5lIEZJRUxEX1NJWkVPRiBpbiBpbmNs
dWRlL2xpbnV4L3N0ZGRlZi5oIGFuZAo+ID4gdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL2Jw
Zl91dGlsLmggYW5kIHJlbW92ZSBpdHMgZGVmaW5hdGlvbiBmcm9tCj4gPiBpbmNsdWRlL2xpbnV4
L2tlcm5lbC5oCj4KPgo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9zdGRkZWYuaAo+ID4gKysrIGIv
aW5jbHVkZS9saW51eC9zdGRkZWYuaAo+ID4gQEAgLTIwLDYgKzIwLDE1IEBAIGVudW0gewo+ID4g
I2VuZGlmCj4gPgo+ID4gLyoqCj4gPiArICogRklFTERfU0laRU9GIC0gZ2V0IHRoZSBzaXplIG9m
IGEgc3RydWN0J3MgZmllbGQKPiA+ICsgKiBAdDogdGhlIHRhcmdldCBzdHJ1Y3QKPiA+ICsgKiBA
ZjogdGhlIHRhcmdldCBzdHJ1Y3QncyBmaWVsZAo+ID4gKyAqIFJldHVybjogdGhlIHNpemUgb2Yg
QGYgaW4gdGhlIHN0cnVjdCBkZWZpbml0aW9uIHdpdGhvdXQgaGF2aW5nIGEKPiA+ICsgKiBkZWNs
YXJlZCBpbnN0YW5jZSBvZiBAdC4KPiA+ICsgKi8KPiA+ICsjZGVmaW5lIEZJRUxEX1NJWkVPRih0
LCBmKSAoc2l6ZW9mKCgodCAqKTApLT5mKSkKPiA+ICsKPiA+ICsvKioKPiA+ICAqIHNpemVvZl9m
aWVsZChUWVBFLCBNRU1CRVIpCj4gPiAgKgo+ID4gICogQFRZUEU6IFRoZSBzdHJ1Y3R1cmUgY29u
dGFpbmluZyB0aGUgZmllbGQgb2YgaW50ZXJlc3QKPiA+IEBAIC0zNCw2ICs0Myw2IEBAIGVudW0g
ewo+ID4gICogQE1FTUJFUjogVGhlIG1lbWJlciB3aXRoaW4gdGhlIHN0cnVjdHVyZSB0byBnZXQg
dGhlIGVuZCBvZmZzZXQgb2YKPiA+ICAqLwo+ID4gI2RlZmluZSBvZmZzZXRvZmVuZChUWVBFLCBN
RU1CRVIpIFwKPiA+IC0gICAgIChvZmZzZXRvZihUWVBFLCBNRU1CRVIpICsgc2l6ZW9mX2ZpZWxk
KFRZUEUsIE1FTUJFUikpCj4gPiArICAgICAob2Zmc2V0b2YoVFlQRSwgTUVNQkVSKSArIEZJRUxE
X1NJWkVPRihUWVBFLCBNRU1CRVIpKQo+Cj4gSWYgeW91J3JlIGRvaW5nIHRoaXMsIHdoeSBhcmUg
eW91IGxlYXZpbmcgdGhlIGRlZmluaXRpb24gb2Ygc2l6ZW9mX2ZpZWxkKCkgaW4KPiBzdGRkZWYu
aCB1bnRvdWNoZWQ/CgpJIGhhdmUgcmVtb3ZlZCBkZWZpbml0aW9uIG9mIHNpemVvZl9maWVsZCBp
biBbMS8yXSBwYXRjaC4KCj4gR2l2ZW4gdGhlIHdheSB0aGlzIGhhcyB3b3JrZWQgaGlzdG9yaWNh
bGx5LCBpZiB5b3UgYXJlIGxlYXZpbmcgaXQgaW4gcGxhY2UgZm9yCj4gc291cmNlIGNvbXBhdGli
aWxpdHkgcmVhc29ucywgc2hvdWxkbid0IGl0IGJlIHJlZGVmaW5lZCBpbiB0ZXJtcyBvZgo+IEZJ
RUxEX1NJWkVPRigpLCBlLmcuOgo+Cj4gI2RlZmluZSBzaXplb2ZfZmllbGQoVFlQRSwgTUVNQkVS
KSBGSUVMRF9TSVpFT0YoVFlQRSwgTUVNQkVSKQoKQWN0dWFsbHksIG5ldmVyIHRob3VnaHQgdGhp
cyB3YXkuIFNvLFRoYW5rcyBhIGxvdCBmb3IgdGhpcyB2YWx1YWJsZSBmZWVkYmFjay4KCkknbGwg
cmUtc3BpbiBhbmQgcG9zdCBhZ2Fpbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
