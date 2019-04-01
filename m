Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp105512ywo;
        Mon, 1 Apr 2019 01:45:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy3zHbFJYk8I1C0UKVfsN4DRs1L/H3aNiqeK4k6mLYM3ca9R3CWwmZlsAj5OLetY6H+Olfm
X-Received: by 2002:a63:f212:: with SMTP id v18mr37068127pgh.231.1554108337527;
        Mon, 01 Apr 2019 01:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554108337; cv=none;
        d=google.com; s=arc-20160816;
        b=kdV7CMszOjqCu/Vk8j06x1Ht8vCNORakthiCLXp14mng9SBDuKcKXSuqRsY2urfvn2
         6wco+S1gr6Mz3TO5QoT0ZnY3JKnM2wqB8UXf509rHkqOkv3QGnJEVdiNCJJwUzhzPiNK
         9R6LBjNDBKQ/eLeQ/iarZGE0SratIdLKy/VFKta4V1QuizoOpX/j2M7lwkybsZUP/T8s
         Q97NqchEok8AzCLR4CGMBcTQx0rHUGbpNXn+/5T7MrdRuGz4+nr7qYrknCrB7d2lqHHb
         +j/MqLuUy6za4GffGwMgdHuCSI5QzHbfx7FUVfVxNux+Ypt3XTkI8MQIOQuvUgj2tj80
         Z0tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=DAgc8+hpDgciDBUl9eLryVdrYb0xbcNl77g3SYdl0RU=;
        b=YwXeLZVVgs0wjaqpAi5+CrWXkkrRwC7hO5McuLV2Sy0PVZVi47/MttRH+EHHsmRG8R
         mbELdRr3/sBp+YjmmunqJbjdqO5I/zqhl4KZgjSDlBPh8ZfjFLXDJsVhRu5WFMh9Kngl
         6gI7BUD+RaTbrl9PCai9wS3muL65pczWxBk18N1YT2q2o3Ep5NHpiMlHwOYUsPL+23Zu
         l/pu1hyd1BY80qsdJPtCNxjEyELOkRERwDrJafRHRD9B9bJ1xVE4jtLXK4owDuAEc1AM
         T1lzSP6qomIcAgzNPD548Yk6EUBXvcqMGzzPro4bVbOAxRS2/B34RQvjU4h2oS5rhhIV
         AukQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id p66si691614pfp.228.2019.04.01.01.45.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Apr 2019 01:45:37 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2EC6E0BB;
	Mon,  1 Apr 2019 08:45:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4CB6E0BB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  1 Apr 2019 08:45:35 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Apr 2019 01:45:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,295,1549958400"; d="scan'208";a="312100939"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by orsmga005.jf.intel.com with ESMTP; 01 Apr 2019 01:45:29 -0700
Date: Mon, 1 Apr 2019 04:40:03 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190401084003.GA1530@joy-OptiPlex-7040>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190219113212.GC2941@work-vm>
 <20190220052838.GC16456@joy-OptiPlex-7040>
 <20190220110142.GD2608@work-vm>
 <33183CC9F5247A488A2544077AF19020DB25D30F@dggeml511-mbx.china.huawei.com>
 <20190220124242.5a1685c5.cohuck@redhat.com>
 <20190327063509.GD14681@joy-OptiPlex-7040>
 <20190327201854.GG2636@work-vm> <20190327161020.1c013e65@x1.home>
 <20190401101430.72d2ef9e.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190401101430.72d2ef9e.cohuck@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gTW9uLCBBcHIgMDEsIDIwMTkgYXQgMDQ6MTQ6MzBQTSArMDgwMCwgQ29ybmVsaWEgSHVjayB3
cm90ZToKPiBPbiBXZWQsIDI3IE1hciAyMDE5IDE2OjEwOjIwIC0wNjAwCj4gQWxleCBXaWxsaWFt
c29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4gd3JvdGU6Cj4gCj4gPiBPbiBXZWQsIDI3
IE1hciAyMDE5IDIwOjE4OjU0ICswMDAwCj4gPiAiRHIuIERhdmlkIEFsYW4gR2lsYmVydCIgPGRn
aWxiZXJ0QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gCj4gPiA+ICogWmhhbyBZYW4gKHlhbi55Lnpo
YW9AaW50ZWwuY29tKSB3cm90ZTogIAo+ID4gPiA+IE9uIFdlZCwgRmViIDIwLCAyMDE5IGF0IDA3
OjQyOjQyUE0gKzA4MDAsIENvcm5lbGlhIEh1Y2sgd3JvdGU6ICAgIAo+ID4gPiA+ID4gPiA+ID4g
PiAgIGIpIEhvdyBkbyB3ZSBkZXRlY3QgaWYgd2UncmUgbWlncmF0aW5nIGZyb20vdG8gdGhlIHdy
b25nIGRldmljZSBvcgo+ID4gPiA+ID4gPiA+ID4gPiB2ZXJzaW9uIG9mIGRldmljZT8gIE9yIHNh
eSB0byBhIGRldmljZSB3aXRoIG9sZGVyIGZpcm13YXJlIG9yIHBlcmhhcHMKPiA+ID4gPiA+ID4g
PiA+ID4gYSBkZXZpY2UgdGhhdCBoYXMgbGVzcyBkZXZpY2UgbWVtb3J5ID8gICAgICAKPiA+ID4g
PiA+ID4gPiA+IEFjdHVhbGx5IGl0J3Mgc3RpbGwgYW4gb3BlbiBmb3IgVkZJTyBtaWdyYXRpb24u
IE5lZWQgdG8gdGhpbmsgYWJvdXQKPiA+ID4gPiA+ID4gPiA+IHdoZXRoZXIgaXQncyBiZXR0ZXIg
dG8gY2hlY2sgdGhhdCBpbiBsaWJ2aXJ0IG9yIHFlbXUgKGxpa2UgYSBkZXZpY2UgbWFnaWMKPiA+
ID4gPiA+ID4gPiA+IGFsb25nIHdpdGggdmVyaW9uID8pLiAgICAgIAo+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gV2UgbXVzdCBrZWVwIHRoZSBoYXJkd2FyZSBnZW5lcmF0aW9uIGlzIHRoZSBzYW1l
IHdpdGggb25lIFBPRCBvZiBwdWJsaWMgY2xvdWQKPiA+ID4gPiA+ID4gcHJvdmlkZXJzLiBCdXQg
d2Ugc3RpbGwgdGhpbmsgYWJvdXQgdGhlIGxpdmUgbWlncmF0aW9uIGJldHdlZW4gZnJvbSB0aGUg
dGhlIGxvd2VyCj4gPiA+ID4gPiA+IGdlbmVyYXRpb24gb2YgaGFyZHdhcmUgbWlncmF0ZWQgdG8g
dGhlIGhpZ2hlciBnZW5lcmF0aW9uLiAgICAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gQWdyZWVkLCBs
b3dlci0+aGlnaGVyIGlzIHRoZSBvbmUgZGlyZWN0aW9uIHRoYXQgbWlnaHQgbWFrZSBzZW5zZSB0
bwo+ID4gPiA+ID4gc3VwcG9ydC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gQnV0IHJlZ2FyZGxlc3Mg
b2YgdGhhdCwgSSB0aGluayB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IGluY29tcGF0aWJsZQo+
ID4gPiA+ID4gZGV2aWNlcy92ZXJzaW9ucyBmYWlsIGRpcmVjdGx5IGluc3RlYWQgb2YgZmFpbGlu
ZyBpbiBhIHN1YnRsZSwgaGFyZCB0bwo+ID4gPiA+ID4gZGVidWcgd2F5LiBNaWdodCBiZSB1c2Vm
dWwgdG8gZG8gc29tZSBpbml0aWFsIHNhbml0eSBjaGVja3MgaW4gbGlidmlydAo+ID4gPiA+ID4g
YXMgd2VsbC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gSG93IGVhc3kgaXMgaXQgdG8gb2J0YWluIHRo
YXQgaW5mb3JtYXRpb24gaW4gYSBmb3JtIHRoYXQgY2FuIGJlCj4gPiA+ID4gPiBjb25zdW1lZCBi
eSBoaWdoZXIgbGF5ZXJzPyBDYW4gd2UgZmluZCBvdXQgdGhlIGRldmljZSB0eXBlIGF0IGxlYXN0
Pwo+ID4gPiA+ID4gV2hhdCBhYm91dCBzb21lIGtpbmQgb2YgcmV2aXNpb24/ICAgIAo+ID4gPiA+
IGhpIEFsZXggYW5kIENvcm5lbGlhCj4gPiA+ID4gZm9yIGRldmljZSBjb21wYXRpYmlsaXR5LCBk
byB5b3UgdGhpbmsgaXQncyBhIGdvb2QgaWRlYSB0byB1c2UgInZlcnNpb24iCj4gPiA+ID4gYW5k
ICJkZXZpY2UgdmVyc2lvbiIgZmllbGRzPwo+ID4gPiA+IAo+ID4gPiA+IHZlcnNpb24gZmllbGQ6
IGlkZW50aWZ5IGxpdmUgbWlncmF0aW9uIGludGVyZmFjZSdzIHZlcnNpb24uIGl0IGNhbiBoYXZl
IGEKPiA+ID4gPiBzb3J0IG9mIGJhY2t3YXJkIGNvbXBhdGliaWxpdHksIGxpa2UgdGFyZ2V0IG1h
Y2hpbmUncyB2ZXJzaW9uID49IHNvdXJjZQo+ID4gPiA+IG1hY2hpbmUncyB2ZXJzaW9uLiBzb21l
dGhpbmcgbGlrZSB0aGF0LiAgCj4gPiAKPiA+IERvbid0IHdlIGVzc2VudGlhbGx5IGFscmVhZHkg
aGF2ZSB0aGlzIHZpYSB0aGUgZGV2aWNlIHNwZWNpZmljIHJlZ2lvbj8KPiA+IFRoZSBzdHJ1Y3Qg
dmZpb19pbmZvX2NhcF9oZWFkZXIgaW5jbHVkZXMgaWQgYW5kIHZlcnNpb24gZmllbGRzLCBzbyB3
ZQo+ID4gY2FuIGRlY2xhcmUgYSBtaWdyYXRpb24gaWQgYW5kIGluY3JlbWVudCB0aGUgdmVyc2lv
biBmb3IgYW55Cj4gPiBpbmNvbXBhdGlibGUgY2hhbmdlcyB0byB0aGUgcHJvdG9jb2wuCj4gPiAK
PiA+ID4gPiAKPiA+ID4gPiBkZXZpY2VfdmVyc2lvbiBmaWVsZCBjb25zaXN0cyB0d28gcGFydHM6
Cj4gPiA+ID4gMS4gdmVuZG9yIGlkIDogaXQgdGFrZXMgMzIgYml0cy4gZS5nLiAweDgwODYuICAK
PiA+IAo+ID4gV2hvIGFsbG9jYXRlcyBJRHM/ICBJZiB3ZSdyZSBnb2luZyB0byB1c2UgUENJIHZl
bmRvciBJRHMsIHRoZW4gSSdkCj4gPiBzdWdnZXN0IHdlIHVzZSBhIGJpdCB0byBmbGFnIGl0IGFz
IHN1Y2ggc28gd2UgY2FuIHJlc2VydmUgdGhhdCBwb3J0aW9uCj4gPiBvZiB0aGUgMzJiaXQgYWRk
cmVzcyBzcGFjZS4gIFNlZSBmb3IgZXhhbXBsZToKPiA+IAo+ID4gI2RlZmluZSBWRklPX1JFR0lP
Tl9UWVBFX1BDSV9WRU5ET1JfVFlQRSAgICAgICAgKDEgPDwgMzEpCj4gPiAjZGVmaW5lIFZGSU9f
UkVHSU9OX1RZUEVfUENJX1ZFTkRPUl9NQVNLICAgICAgICAoMHhmZmZmKQo+ID4gCj4gPiBGb3Ig
dmVuZG9yIHNwZWNpZmljIHJlZ2lvbnMuCj4gCj4gSnVzdCBicm93c2luZyB0aHJvdWdoIHRoZSB0
aHJlYWQuLi4gaWYgSSBkb24ndCBtaXN1bmRlcnN0YW5kLCB3ZSBjb3VsZAo+IHVzZSBhIHZmaW8t
Y2N3IHJlZ2lvbiB0eXBlIGlkIGhlcmUgZm9yIGNjdywgY291bGRuJ3Qgd2U/IEp1c3QgdG8gbWFr
ZQo+IHN1cmUgdGhhdCB0aGlzIGlzIG5vdCBwY2ktc3BlY2lmaWMuCkNDVyBjb3VsZCB1c2UgYW5v
dGhlciBiaXQgb3RoZXIgdGhhbiBiaXQgMzE/CmUuZy4KI2RlZmluZSBWRklPX1JFR0lPTl9UWVBF
X0NDV19WRU5ET1JfVFlQRSAgICAgICAgKDEgPDwgMzApCnRoZW4gY2N3IGRldmljZSB1c2UgKFZG
SU9fUkVHSU9OX1RZUEVfQ0NXX1ZFTkRPUl9UWVBFIHwgdmVuZG9yIGlkKSBhcyBpdHMKZmlyc3Qg
MzIgYml0IGZvciBkZXZpY2UgdmVyc2lvbiBzdHJpbmcuCgpCdXQgYXMgQWxleCBzYWlkIHdlJ2xs
IG5vdCBwcm92aWRlIGFuIGV4dHJhIHJlZ2lvbiB0byBnZXQgZGV2aWNlIHZlcnNpb24sCmFuZCBk
ZXZpY2UgdmVyc2lvbiBpcyBvbmx5IGV4cG9ydGVkIGluIHN5c2ZzLCBwcm9iYWJseSB3ZSBzaG91
bGQgZGVmaW5lIHRoZW0gYXMKYmVsb3c6CiNkZWZpbmUgVkZJT19ERVZJQ0VfVkVSU0lPTl9UWVBF
X1BDSSAoMTw8MzEpCiNkZWZpbmUgVkZJT19ERVZJQ0VfVkVSU0lPTl9UWVBFX0NDVyAoMTw8MzAp
CgpEbyB5b3UgdGhpbmsgaXQncyBvaz8KClRoYW5rcwpZYW4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
