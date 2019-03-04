Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp3897028ywe;
        Mon, 4 Mar 2019 14:29:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwgoaoXd4+y6NDKIDLx3Ff5F5ui7JB5ZeKsHRWh598qhgg8JaMI+A6MDLqen6Znut21Yx05
X-Received: by 2002:a17:902:765:: with SMTP id 92mr22247165pli.95.1551738563389;
        Mon, 04 Mar 2019 14:29:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551738563; cv=none;
        d=google.com; s=arc-20160816;
        b=Swrn34kkQCfIL9VjzWvJUbnE02g/mAH8OigZ+00AHXtR4vhEjWfy9fb0MTq99Q6YWl
         s28eyYh1UWrxuQSA7Yqr4XjWp9t/4kwCye1AtwVqctVmg71RMA/4QWDb1Qdm4Ar44/Cs
         9kgWgovFoI+YK15X3IytFPDy6rtj3e1jOGHwrVBOkDUKpO+o/gNGhXxfutYVydNmm6Nx
         JFQD1CzWnobwSGTcGQ34OqMr3vLGPCmLmKr9olZaZmCBcYndS6Bp9bvOaX9krtJJDVZO
         vTgHqi9qczjX05MwMDovKcsTK3b/Kn82S0+LjYf7BtdKB3nwGOEZpR8UvHFnIuOY4RYP
         N/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:delivered-to;
        bh=q7PSqOA7UGZ7x0b6mi2Mg2cHe2UduB4RajjFU4ya+O0=;
        b=W8NLo3tFrIb6ijdNnTxIaNkxgFbtJd3vtya+WpIsZjQmhQvXLymWV+XFVsWG3yyNbz
         nIxIKOovHc7FVZPw2VqqkTJzEoTP/5vaDfv9/vVl9vMYGZewi2tiSbuSbSTkK1BOkBEd
         fni3pX3Q0ar0/Hv9OR+fnXQdqr6LpAW/WPFcdMya5m7yDY8pF+bnfYPyxOCjAkiHIraL
         5akXKrOvArwepvDXcl/6NspmSn/xOARQu2tVyU8awMKe0VAwwLYWCvqIO4Z+2E93prN8
         VT6pp4hlIuIEr7Cu0BOrm/oKkZLBkpDgNUwDWH0Yxb4fAJFub3NT0n4hfuOnG4+ZL5kG
         hnfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id k24si5731312pgj.228.2019.03.04.14.29.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2019 14:29:23 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1AA89D02;
	Mon,  4 Mar 2019 22:29:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE5889D02
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  4 Mar 2019 22:29:21 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f65so715709wma.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 04 Mar 2019 14:29:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IosQ+6ghkuAcA7zHOXskJ0otZDTeLjEtuvg+JTH1ZSo=;
 b=rRg9HLu1bQ64bvvXa87iJzpxC+nz3dFrRN7C3H+DE9BaNU+oBpwkwdxg/vbtlVQ2HP
 xnM21r/Bc4+CBSObdLqHPM3ufA6vHS1/VZsxsUWAe5GD3cnmPLHGgq21+fWhAgeaKprC
 6BuQm83p2eueXY8vUOCoaQyqIvO/Q/T4nGHTelbfOYnhiRyulSMAq2CEZtkxcB+72wHa
 u9swHBUB6QKUp3Hpc8tcKRGK5GbtTxYWpU+xBozNqLO4uBFehf9yMxnXCinsbREu+8Fg
 BlcMeQlkNcKA3pVQA64R2ONKX2m9FW0jkvgO7snXTbGX90yCngSB+EShSbaQbOG/kCDg
 /Daw==
X-Gm-Message-State: APjAAAX2fYYuTHfQuKoH6l1+SN8MeuWiu13rPxB0nlkU9jyMwJGtEp7f
 WiYWo7W7dUzw/qTBq3tx9aO1Ige5qOdNVbpJyRs=
X-Received: by 2002:a1c:6342:: with SMTP id x63mr756943wmb.92.1551738559982;
 Mon, 04 Mar 2019 14:29:19 -0800 (PST)
MIME-Version: 1.0
References: <201903041716.fgiYbB8X%fengguang.wu@intel.com>
 <CAEsyxyiXUdRM4DJGPsz6Nn21HW+Q1qHAdByzcwFiMFYKxKXmyw@mail.gmail.com>
 <CAMwc25pEKsxukCBzDBOAhvvMAMFDNEOEOpEf+kGvVVJfnf6xBw@mail.gmail.com>
 <CAMwc25pu8h0RyDM=pgoakmewPhCaWeLuWVV3C1mxKLUvks1Mhg@mail.gmail.com>
In-Reply-To: <CAMwc25pu8h0RyDM=pgoakmewPhCaWeLuWVV3C1mxKLUvks1Mhg@mail.gmail.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Mon, 4 Mar 2019 23:29:08 +0100
Message-ID: <CAEsyxyi9bszjVq+L0=4TrDGqr_=HRQUFc+dCTHLiYX8XwWrPPQ@mail.gmail.com>
Subject: Re: [intel-gvt-linux:gvt-staging 1991/2009]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4832:10:
 warning: assignment makes integer from pointer without a cast
To: David Airlie <airlied@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=IosQ+6ghkuAcA7zHOXskJ0otZDTeLjEtuvg+JTH1ZSo=;
 b=IDdVaoaMMbgLaQ9sS+ntceFN00MpCPlSfFRLMKNHNnEj/I6AUSoxM0iQ0mBnffOoNo
 CV+6pWHThqxeQTK/T9Od/ckdxC5pmV6imz7ayD944XsB2nt9Nkij03lDp9LWpV8mt80s
 I1vMqccFdzFFomRhuQiR5tpmYe8/A8h7hZWL1BC8KYq/xTI3/xxi6ATPdMJ2zaCjr4JP
 GHBVu7JwSIaoo5MWkzryG81RnH2Hv6kO+jtH7XKMEvxOCLdq57xApqWf0JobTB8OK+1v
 douUzGXmboiLsPukCBUn8PSJA+X3nAFnaGpaAgag02/ImWgUIvoD7X4MFpJSjQup+ryf
 kyrg==
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
Cc: kbuild test robot <lkp@intel.com>, zhenyu.z.wang@intel.com,
 terrence.xu@intel.com, kbuild-all@01.org,
 Alex Deucher <alexander.deucher@amd.com>, libo.zhu@intel.com,
 intel-gvt-dev@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgNCwgMjAxOSBhdCAxMToxNiBQTSBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1hciA1LCAyMDE5IGF0IDg6MTEgQU0gRGF2aWQg
QWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgTWFyIDUs
IDIwMTkgYXQgODowNSBBTSBNYXJpbyBLbGVpbmVyIDxtYXJpby5rbGVpbmVyLmRlQGdtYWlsLmNv
bT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9rLAo+ID4gPgo+ID4gPiBzb3JyeSBmb3IgdGhlIGxhdGUg
cmVwbGllcy4gTXkgbWFpbCBjbGllbnQgc29tZWhvdyBkaWRuJ3Qgc2hvdyBtZSBhbGwKPiA+ID4g
dGhlIGNvbnZlcnNhdGlvbnMgYXJvdW5kIHRoaXMgcGF0Y2ggb3ZlciB0aGUgd2Vla2VuZCA6LS8u
Cj4gPiA+Cj4gPiA+IEkgaGFkIGEgbG9vayBhdCB0aGUgdmFyaW91cyB0cmVlcyB3cnQuIHRvIHRo
ZSBwYXRjaCAiZHJtL2FtZC9kaXNwbGF5Ogo+ID4gPiBVc2UgdnJyIGZyaWVuZGx5IHBhZ2VmbGlw
IHRocm90dGxpbmcgaW4gREMuIgo+ID4gPgo+ID4gPiBXZSBhcHBhcmVudGx5IGhhdmUgMyBkaWZm
ZXJlbnQgdmVyc2lvbnMgb2YgdGhlIHBhdGNoLCBtb2RpZmllZCBmb3IKPiA+ID4gdGhyZWUgZGlm
ZmVyZW50IHdheXMgdGhhdCBhbWRncHUgREMgbG9va3MgZGVwZW5kaW5nIG9uIDUuMC81LjEvNS4y
IGFzCj4gPiA+IHRoZXJlIGhhcyBiZWVuIGEgbG90IG9mIHJlZmFjdG9yaW5nLCBhbmQgdGhlbiBz
b21lIG1peHVwcyBpbiB3aGljaAo+ID4gPiBwYXRjaCBuZWVkcyB0byBlbmQgdXAgaW4gd2hpY2gg
YnJhbmNoIDotLwo+ID4gPgo+ID4gPiBUaGUgcGF0Y2ggaW4gTGludXggNS4wLjAgYW5kIGN1cnJl
bnQgZHJtLWZpeGVzIGlzIGNvcnJlY3QsIHNvIHRoZQo+ID4gPiByZWxlYXNlZCBrZXJuZWwgaXMg
ZmluZS4KPiA+ID4KPiA+ID4gVGhlIHBhdGNoIGluIGN1cnJlbnQgZHJtLW5leHQgKHByZXN1bWFi
bHkgcHVsbGVkIGZyb20KPiA+ID4gYWdkNWYvZHJtLW5leHQtNS4yLXdpcCkgYW5kIGN1cnJlbnQg
YWdkNWYvZHJtLW5leHQtNS4yLXdpcCBhbmQKPiA+ID4gZHJtLW5leHQtNS4xLXdpcCBhbmQgZHJt
LW5leHQtNS4xIGlzICp3cm9uZyouIFN0cmFuZ2VseSBpdCBkb2Vzbid0Cj4gPiA+IGNvcnJlc3Bv
bmQgdG8gdGhlIHBhdGNoIGkgc2VudCBvdXQgdG8gdGhlIG1haWxpbmcgbGlzdCwgYW5kIHRoYXQg
d2FzCj4gPiA+IHJldmlld2VkLWJ5IGFuZCB0ZXN0ZWQgYnkgTmljaG9sYXMsIHdoaWNoIHdhcyBj
b3JyZWN0Lgo+ID4KPiA+IFByb2JhYmx5IG15IGZhdWx0LCBBbGV4IHNhaWQgdGhlIHBhdGNoIGlu
IGhpcyBkcm0tbmV4dC01LjItd2lwIHdhcyB0aGUKPiA+IG9uZSwgSSBwdWxsZWQgaXQgYnV0IGRp
ZG4ndCBnbyBiYWNrIGFuZCBjaGVjayBmb3IgYW55IG1haWxpbmcgbGlzdAo+ID4gZGlzY3Vzc2lv
bi4KPiA+Cj4gPiBJJ2xsIG1ha2UgdGhpcyBjaGFuZ2UgaW4gZHJtLW5leHQsIEknbSB0cnlpbmcg
dG8gZGVjaWRlIGlmIGl0J3Mgd29ydGgKPiA+IGZvcmNlIHB1c2hpbmcgaXQuCj4gPgo+IE9rYXkg
SSd2ZSBmb3JjZSBwdXNoZWQgZHJtLW5leHQgd2l0aCB0aGUgY2hhbmdlIHlvdSBhc2tlZCBmb3Is
Cj4KPiBQbGVhc2UgY29uZmlybSBpdC4KPgoKWWVzLCB0aGUgZm9yY2UgcHVzaGVkIHBhdGNoIGlu
IGRybS1uZXh0IGlzIG5vdyBjb3JyZWN0LgoKQnV0IHRoZSBidWdneSBwYXRjaCBpcyBhbHNvIHBy
ZXNlbnQgaW4gQWxleCBkcm0tbmV4dC01LjEvNS4yWy13aXBdCmJyYW5jaGVzLCBzbyBpIGd1ZXNz
IEFsZXggbmVlZHMgdG8gc29tZWhvdyBwdWxsIHRoaXMgYmFjayBpbnRvIGhpcwp0cmVlLCBvciBm
aXggaXQgdXAgZm9yIHRoZSA1LjEgcmVsZWFzZSwgbWF5YmUgYWxzbyBmb3JjZSBwdXNoIGZvciA1
LjEuCgpUaGUgc3R1ZmYgaW4gYWdkNWYvYW1kLXN0YWdpbmctZHJtLW5leHQgYnJhbmNoIGlzIGNv
cnJlY3QgZm9yIHRoZQpjdXJyZW50IHN0YXRlIG9mIHRoYXQgYnJhbmNoLiBJIGV4cGVjdCB0aGF0
IHN0dWZmIGFuZCBldmVyeXRoaW5nCnJlbGF0aW5nIHRvIExpbnV4IDUuMiB3aWxsIGJlIHN1cGVy
c2VkZWQgYnkgdGhlIHBhdGNoIGknbSB3b3JraW5nIG9uCmF0bS4gYmVmb3JlIHRoZSA1LjIgbWVy
Z2Ugd2luZG93LgoKLW1hcmlvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaW50ZWwtZ3Z0LWRldg==
