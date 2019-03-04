Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp3888244ywe;
        Mon, 4 Mar 2019 14:16:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqwH9AUluzGZ64T53ROs2CC3KfukH1hZMZZqEhRou8OThutr5j5nowicnmwxlYKjtg0KPWWX
X-Received: by 2002:a63:e752:: with SMTP id j18mr20323342pgk.313.1551737774172;
        Mon, 04 Mar 2019 14:16:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551737774; cv=none;
        d=google.com; s=arc-20160816;
        b=GmhnJZXdHcjlkkPMlr7QMuE4aqDVeu17xDeZsgfJGqtqV7FArDPI8L5dkaq0BxalE5
         hdq8qmbk6XmY/QIRUIFE4ZJtPoPmDSfbJslWB3x8UHhm9xEOA2lNnaj1Wrv+OEt1ZVh3
         5OJ0s4TAOVj/T6dog1+v0C7YLZh8KBXcAqfqtFlH6fouKn8Qcy/YpDlVqwWl5OfAU6BC
         dMZbPA1XljQirRIb+LrsmHlKsijzIYi6ccKoYKWnSGoAOYw+KQYqS3cZL21nN4oxRp9Q
         N6yfV0CumcxV/tGLx8aovHPZwVAh5U/fPhukTXpWMnQv7d12HL+E/ZwPOqFWAR+uGMmp
         I4lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:delivered-to;
        bh=0C0xyyyWc2P2HQQbgeB4ASFTpHqP2P6bmOWJMjLsXRo=;
        b=CtXewVO11vWdOggGpTnrCR6QdroPeJpw43RPaz9CA0EVGvWDpDDp8rsM9qCwnixA/S
         r6RY4sGDJnzse1K7J9XJsnHex/hMsHgBDK+ODaUM0EbK1sYowz+Cyg5Y+G3w2RPXavMc
         aoG1cP0F+9Y7bs0AVX8Tz98y1xlhpylfwv7MbdhmxIIRra2tnVNSx+/qpaEhyZca1300
         dtIGmJxf+Qi0PDnjdQV0tVYp46tdfGybkuv41FAU9APJ+UG02aCKYeD+EQV9EQrgpv9n
         X05Zc5/XEfdqc8Tr6ppczYtw4CXRCucRLw2XDj3qj/7yonm8kMADzjyJb2UhOQ/E1Oau
         s+Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id f3si6389901pfc.158.2019.03.04.14.16.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2019 14:16:14 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0ED89C53;
	Mon,  4 Mar 2019 22:16:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48CD89C53
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  4 Mar 2019 22:16:12 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id e15so5910000uam.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 04 Mar 2019 14:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NM6DG7XchNA2MoDcbU8tRRPN+v2YeSUNevMA/AQEVm4=;
 b=A45dgI7G+8aQIK11adlm5vvrS1Gn5EI7A1oGPrCWbSgqr86B9rKCsSzHUnr6TplzFG
 HkNCLrROJ95TU7Kn/dFJrtPMACpSpYkEoq08jYb/wG7KJD5rFVZWTBQkWw6Ujh/QXYLd
 L8CH/EHRDM/081M2QglYdU+2N5D1r+TX68mV1YpgTUGw1NwDoFaRZy6HpFnmNAIKEoG2
 rIDvrF9bnURswDm6O82wEN+HLQqFMbhHh36XM0PjVX0cfTbSQZHvuKGaaidVywXqudvP
 fNuIwbp7S2TvyloJP84muxax5WTK2sB0vsrENA7JQxjbho5U0N3h2qqm3OosiuHpmOK8
 zutw==
X-Gm-Message-State: APjAAAU1FswGxbIjcL8f3fe/nUiQyNEQQoGyiup0gNG299EUfyCOjzCM
 xZDPydbOkXFFq7xHhR5JELm37HUyOEdv5jOblMJvMQ==
X-Received: by 2002:a67:dd83:: with SMTP id i3mr10917016vsk.120.1551737771632; 
 Mon, 04 Mar 2019 14:16:11 -0800 (PST)
MIME-Version: 1.0
References: <201903041716.fgiYbB8X%fengguang.wu@intel.com>
 <CAEsyxyiXUdRM4DJGPsz6Nn21HW+Q1qHAdByzcwFiMFYKxKXmyw@mail.gmail.com>
 <CAMwc25pEKsxukCBzDBOAhvvMAMFDNEOEOpEf+kGvVVJfnf6xBw@mail.gmail.com>
In-Reply-To: <CAMwc25pEKsxukCBzDBOAhvvMAMFDNEOEOpEf+kGvVVJfnf6xBw@mail.gmail.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 5 Mar 2019 08:16:00 +1000
Message-ID: <CAMwc25pu8h0RyDM=pgoakmewPhCaWeLuWVV3C1mxKLUvks1Mhg@mail.gmail.com>
Subject: Re: [intel-gvt-linux:gvt-staging 1991/2009]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4832:10:
 warning: assignment makes integer from pointer without a cast
To: Mario Kleiner <mario.kleiner.de@gmail.com>
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

T24gVHVlLCBNYXIgNSwgMjAxOSBhdCA4OjExIEFNIERhdmlkIEFpcmxpZSA8YWlybGllZEByZWRo
YXQuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWFyIDUsIDIwMTkgYXQgODowNSBBTSBNYXJpbyBL
bGVpbmVyIDxtYXJpby5rbGVpbmVyLmRlQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT2ssCj4g
Pgo+ID4gc29ycnkgZm9yIHRoZSBsYXRlIHJlcGxpZXMuIE15IG1haWwgY2xpZW50IHNvbWVob3cg
ZGlkbid0IHNob3cgbWUgYWxsCj4gPiB0aGUgY29udmVyc2F0aW9ucyBhcm91bmQgdGhpcyBwYXRj
aCBvdmVyIHRoZSB3ZWVrZW5kIDotLy4KPiA+Cj4gPiBJIGhhZCBhIGxvb2sgYXQgdGhlIHZhcmlv
dXMgdHJlZXMgd3J0LiB0byB0aGUgcGF0Y2ggImRybS9hbWQvZGlzcGxheToKPiA+IFVzZSB2cnIg
ZnJpZW5kbHkgcGFnZWZsaXAgdGhyb3R0bGluZyBpbiBEQy4iCj4gPgo+ID4gV2UgYXBwYXJlbnRs
eSBoYXZlIDMgZGlmZmVyZW50IHZlcnNpb25zIG9mIHRoZSBwYXRjaCwgbW9kaWZpZWQgZm9yCj4g
PiB0aHJlZSBkaWZmZXJlbnQgd2F5cyB0aGF0IGFtZGdwdSBEQyBsb29rcyBkZXBlbmRpbmcgb24g
NS4wLzUuMS81LjIgYXMKPiA+IHRoZXJlIGhhcyBiZWVuIGEgbG90IG9mIHJlZmFjdG9yaW5nLCBh
bmQgdGhlbiBzb21lIG1peHVwcyBpbiB3aGljaAo+ID4gcGF0Y2ggbmVlZHMgdG8gZW5kIHVwIGlu
IHdoaWNoIGJyYW5jaCA6LS8KPiA+Cj4gPiBUaGUgcGF0Y2ggaW4gTGludXggNS4wLjAgYW5kIGN1
cnJlbnQgZHJtLWZpeGVzIGlzIGNvcnJlY3QsIHNvIHRoZQo+ID4gcmVsZWFzZWQga2VybmVsIGlz
IGZpbmUuCj4gPgo+ID4gVGhlIHBhdGNoIGluIGN1cnJlbnQgZHJtLW5leHQgKHByZXN1bWFibHkg
cHVsbGVkIGZyb20KPiA+IGFnZDVmL2RybS1uZXh0LTUuMi13aXApIGFuZCBjdXJyZW50IGFnZDVm
L2RybS1uZXh0LTUuMi13aXAgYW5kCj4gPiBkcm0tbmV4dC01LjEtd2lwIGFuZCBkcm0tbmV4dC01
LjEgaXMgKndyb25nKi4gU3RyYW5nZWx5IGl0IGRvZXNuJ3QKPiA+IGNvcnJlc3BvbmQgdG8gdGhl
IHBhdGNoIGkgc2VudCBvdXQgdG8gdGhlIG1haWxpbmcgbGlzdCwgYW5kIHRoYXQgd2FzCj4gPiBy
ZXZpZXdlZC1ieSBhbmQgdGVzdGVkIGJ5IE5pY2hvbGFzLCB3aGljaCB3YXMgY29ycmVjdC4KPgo+
IFByb2JhYmx5IG15IGZhdWx0LCBBbGV4IHNhaWQgdGhlIHBhdGNoIGluIGhpcyBkcm0tbmV4dC01
LjItd2lwIHdhcyB0aGUKPiBvbmUsIEkgcHVsbGVkIGl0IGJ1dCBkaWRuJ3QgZ28gYmFjayBhbmQg
Y2hlY2sgZm9yIGFueSBtYWlsaW5nIGxpc3QKPiBkaXNjdXNzaW9uLgo+Cj4gSSdsbCBtYWtlIHRo
aXMgY2hhbmdlIGluIGRybS1uZXh0LCBJJ20gdHJ5aW5nIHRvIGRlY2lkZSBpZiBpdCdzIHdvcnRo
Cj4gZm9yY2UgcHVzaGluZyBpdC4KPgpPa2F5IEkndmUgZm9yY2UgcHVzaGVkIGRybS1uZXh0IHdp
dGggdGhlIGNoYW5nZSB5b3UgYXNrZWQgZm9yLAoKUGxlYXNlIGNvbmZpcm0gaXQuCgpUaGFua3Ms
CkRhdmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlu
dGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwt
Z3Z0LWRldg==
