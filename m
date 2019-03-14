Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp4245967ywb;
        Wed, 13 Mar 2019 18:17:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQu13DzsHyiEs5qaOT+bc7Wk8GrUEDS223JQp24NXqR9ET5u0PzUQ3rMO46W5jJ2FBrLQ3
X-Received: by 2002:a17:902:f44:: with SMTP id 62mr1886764ply.43.1552526269371;
        Wed, 13 Mar 2019 18:17:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552526269; cv=none;
        d=google.com; s=arc-20160816;
        b=gIqxI0cC+Mp0BtevnnINpjgZvjINELz6dxQC/qzIsNXawDZqMTjjnd6tn3FYIQQ1L9
         Wu+EAeB0tvu3qwQCtCJ83edneaPnvGFwwrCWkB1zevrP71pJSD0e6Ed7dn/huMn53Nnm
         96WRsy5t+hYwgIu98hvcJTm2Ox7VmoU6l0vQOvigRP+Dmceh7QC0xUuekVrG4P0BA8pH
         jgHv4iEACyWb7Rb7wh2iRbI//Gn6MCGo/KCQhzlbw6jruIQA8GYRoT0odwZa40BTuNfo
         ZBppt6sio0ootMFtfCcsdQbsfgW0x8f4UC55mxVxFkzs5LhRV9pq0c5lmhVX7JEsHJWZ
         SPkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=5coV7sPT8iPq25kntXtSrNNiLTX9cvF7WA+atqmqx00=;
        b=hGTxb03fxzxQh/HXnSoaaB4CW98/g5bdLi+oJfp8VD0b2I3KRvnPzr3PxA8opqCgmG
         VWs1ibiSEDg6huTJD0wTuYI9Y+SKderyih3cGOrC01hhm6BeQxeUaxg+btnc+9uKUx/7
         SkYLrTafbihlZgGged/4vK8JHHD+xzBFBiNlrhn7fcyYyycFGDykxoC5DFbfekxcdy7I
         ld52VVMncXIewMUrOEv3BnDMlhbvn5IwpGFQbKvdrhthDbqzoPYk0GswRw1AHFBqDqSV
         HVKyPCADuKXptg628keDT0OMS0kH09uFQEJ/dp3trwAVKdHTu4Qr3h+bXSGnnFvvOUsC
         4plg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id b17si11506157pfm.57.2019.03.13.18.17.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2019 18:17:49 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F7D6E117;
	Thu, 14 Mar 2019 01:17:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CFD6E117
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 14 Mar 2019 01:17:47 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2019 18:17:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,476,1544515200"; d="scan'208";a="140590938"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Mar 2019 18:17:42 -0700
Date: Wed, 13 Mar 2019 21:12:22 -0400
From: Zhao Yan <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190314011222.GA17006@joy-OptiPlex-7040>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190221134051.2c28893e@w520.home>
 <20190225022255.GP16456@joy-OptiPlex-7040>
 <20190307104421.534ea56f@w520.home>
 <20190312025747.GI21353@joy-OptiPlex-7040>
 <20190313011301.GA16072@joy-OptiPlex-7040>
 <20190313131454.09f886c1@w520.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190313131454.09f886c1@w520.home>
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@Alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXIgMTQsIDIwMTkgYXQgMDM6MTQ6NTRBTSArMDgwMCwgQWxleCBXaWxsaWFtc29u
IHdyb3RlOgo+IE9uIFR1ZSwgMTIgTWFyIDIwMTkgMjE6MTM6MDEgLTA0MDAKPiBaaGFvIFlhbiA8
eWFuLnkuemhhb0BpbnRlbC5jb20+IHdyb3RlOgo+IAo+ID4gaGkgQWxleAo+ID4gQW55IGNvbW1l
bnRzIHRvIHRoZSBzZXF1ZW5jZSBiZWxvdz8KPiA+IAo+ID4gQWN0YXVsbHkgd2UgaGF2ZSBzb21l
IGNvbmNlcm5zIGFuZCBzdWdnZXN0aW9ucyB0byB1c2Vyc3BhY2Utb3BhcXVlIG1pZ3JhdGlvbgo+
ID4gZGF0YS4KPiA+IAo+ID4gMS4gaWYgZGF0YSBpcyBvcGFxdWUgdG8gdXNlcnNwYWNlLCBrZXJu
ZWwgaW50ZXJmYWNlIG11c3QgYmUgdGlnaHRseSBib3VuZCB0bwo+ID4gbWlncmF0aW9uLiAKPiA+
ICAgIGUuZy4gdmVuZG9yIGRyaXZlciBoYXMgdG8ga25vdyBzdGF0ZSAocnVubmluZyArIG5vdCBs
b2dnaW5nKSBzaG91bGQgbm90Cj4gPiAgICByZXR1cm4gYW55IGRhdGEsIGFuZCBzdGF0ZSAocnVu
bmluZyArIGxvZ2dpbmcpIHNob3VsZCByZXR1cm4gd2hvbGUKPiA+ICAgIHNuYXBzaG90IGZpcnN0
IGFuZCBkaXJ0eSBsYXRlci4gaXQgYWxzbyBoYXMgdG8ga25vdyBxZW11IG1pZ3JhdGlvbiB3aWxs
Cj4gPiAgICBub3QgY2FsbCBHRVRfQlVGRkVSIGluIHN0YXRlIChydW5uaW5nICsgbm90IGxvZ2dp
bmcpLCBvdGhlcndpc2UsIGl0IGhhcwo+ID4gICAgdG8gYWRqdXN0IGl0cyBiZWhhdmlvci4KPiAK
PiBUaGlzIGFsbCBqdXN0IHNvdW5kcyBsaWtlIGRlZmluaW5nIHRoZSBwcm90b2NvbCB3ZSBleHBl
Y3Qgd2l0aCB0aGUKPiBpbnRlcmZhY2UuICBGb3IgaW5zdGFuY2UgaWYgd2UgZGVmaW5lIGEgc2Vz
c2lvbiBhcyBiZWdpbm5pbmcgd2hlbgo+IGxvZ2dpbmcgaXMgZW5hYmxlZCBhbmQgZW5kaW5nIHdo
ZW4gdGhlIGRldmljZSBpcyBzdG9wcGVkIGFuZCB0aGUKPiBpbnRlcmZhY2UgcmVwb3J0cyBubyBt
b3JlIGRhdGEgaXMgYXZhaWxhYmxlLCB0aGVuIHdlIGNhbiBzdGF0ZSB0aGF0IGFueQo+IHBhcnRp
YWwgYWNjdW11bGF0aW9uIG9mIGRhdGEgaXMgaW5jb21wbGV0ZSByZWxhdGl2ZSB0byBtaWdyYXRp
b24uICBJZgo+IHVzZXJzcGFjZSB3YW50cyB0byBpbml0aWF0ZSBhIG5ldyBtaWdyYXRpb24gc3Ry
ZWFtLCB0aGV5IGNhbiBzaW1wbHkKPiB0b2dnbGUgbG9nZ2luZy4gIEhvdyB0aGUgdmVuZG9yIGRy
aXZlciBwcm92aWRlcyB0aGUgZGF0YSBkdXJpbmcgdGhlCj4gc2Vzc2lvbiBpcyBub3QgZGVmaW5l
ZCwgYnV0IGJlZ2lubmluZyB0aGUgc2Vzc2lvbiB3aXRoIGEgc25hcHNob3QKPiBmb2xsb3dlZCBi
eSByZXBlYXRlZCBpdGVyYXRpb25zIG9mIGRpcnRpZWQgZGF0YSBpcyBjZXJ0YWlubHkgYSB2YWxp
ZAo+IGFwcHJvYWNoLgo+IAo+ID4gMi4gdmVuZG9yIGRyaXZlciBjYW5ub3QgZW5zdXJlIHVzZXJz
cGFjZSBnZXQgYWxsIHRoZSBkYXRhIGl0IGludGVuZHMgdG8KPiA+IHNhdmUgaW4gcHJlLWNvcHkg
cGhhc2UuCj4gPiAgIGUuZy4gaW4gc3RvcC1hbmQtY29weSBwaGFzZSwgdmVuZG9yIGRyaXZlciBo
YXMgdG8gZmlyc3QgY2hlY2sgYW5kIHNlbmQKPiA+ICAgZGF0YSBpbiBwcmV2aW91cyBwaGFzZS4K
PiAKPiBGaXJzdCwgSSBkb24ndCB0aGluayB0aGUgZGV2aWNlIGhhcyBjb250cm9sIG9mIHdoZW4g
UUVNVSBzd2l0Y2hlcyBmcm9tCj4gcHJlLWNvcHkgdG8gc3RvcC1hbmQtY29weSwgdGhlIHByb3Rv
Y29sIG5lZWRzIHRvIHN1cHBvcnQgdGhhdAo+IHRyYW5zaXRpb24gYXQgYW55IHBvaW50LiAgSG93
ZXZlciwgaXQgc2VlbXMgYSBzaW1wbHkgZGF0YSBhdmFpbGFibGUKPiBjb3VudGVyIHByb3ZpZGVz
IGFuIGluZGljYXRpb24gb2Ygd2hlbiBpdCBtaWdodCBiZSBvcHRpbWFsIHRvIG1ha2Ugc3VjaAo+
IGEgdHJhbnNpdGlvbi4gIElmIGEgdmVuZG9yIGRyaXZlciBmb2xsb3dzIGEgc2NoZW1lIGFzIGFi
b3ZlLCB0aGUKPiBhdmFpbGFibGUgZGF0YSBjb3VudGVyIHdvdWxkIGluZGljYXRlIGEgbGFyZ2Ug
dmFsdWUsIHRoZSBlbnRpcmUgaW5pdGlhbAo+IHNuYXBzaG90IG9mIHRoZSBkZXZpY2UuICBBcyB0
aGUgbWlncmF0aW9uIGNvbnRpbnVlcyBhbmQgcGFnZXMgYXJlCj4gZGlydGllZCwgdGhlIGRldmlj
ZSB3b3VsZCByZWFjaCBhIHN0ZWFkeSBzdGF0ZSBhbW91bnQgb2YgZGF0YQo+IGF2YWlsYWJsZSwg
ZGVwZW5kaW5nIG9uIHRoZSBndWVzdCBhY3Rpdml0eS4gIFRoaXMgY291bGQgaW5kaWNhdGUgdG8g
dGhlCj4gdXNlciB0byBzdG9wIHRoZSBkZXZpY2UuICBUaGUgbWlncmF0aW9uIHN0cmVhbSB3b3Vs
ZCBub3QgYmUgY29uc2lkZXJlZAo+IGNvbXBsZXRlZCB1bnRpbCB0aGUgYXZhaWxhYmxlIGRhdGEg
Y291bnRlciByZWFjaGVzIHplcm8gd2hpbGUgdGhlCj4gZGV2aWNlIGlzIGluIHRoZSBzdG9wcGVk
fGxvZ2dpbmcgc3RhdGUuCj4gCj4gPiAzLiBpZiBhbGwgdGhlIHNlcXVlbmNlIGlzIHRpZ2h0bHkg
Ym91bmQgdG8gbGl2ZSBtaWdyYXRpb24sIGNhbiB3ZSByZW1vdmUgdGhlCj4gPiBsb2dnaW5nIHN0
YXRlPyB3aGF0IGFib3V0IGFkZGluZyB0d28gc3RhdGVzIG1pZ3JhdGUtaW4gYW5kIG1pZ3JhdGUt
b3V0Pwo+ID4gc28gdGhlcmUgYXJlIGZvdXIgc3RhdGVzOiBydW5uaW5nLCBzdG9wcGVkLCBtaWdy
YXRlLWluLCBtaWdyYXRlLW91dC4KPiA+ICAgIG1pZ3JhdGUtb3V0IGlzIGZvciBzb3VyY2Ugc2lk
ZSB3aGVuIG1pZ3JhdGlvbiBzdGFydHMuIHRvZ2V0aGVyIHdpdGgKPiA+ICAgIHN0YXRlIHJ1bm5p
bmcgYW5kIHN0b3BwZWQsIGl0IGNhbiBzdWJzdGl0dXRlIHN0YXRlIGxvZ2dpbmcuCj4gPiAgICBt
aWdyYXRlLWluIGlzIGZvciB0YXJnZXQgc2lkZS4KPiAKPiBJbiBmYWN0LCBLaXJ0aSdzIGltcGxl
bWVudGF0aW9uIHNwZWNpZmllcyBhIGRhdGEgZGlyZWN0aW9uLCBidXQgSSB0aGluawo+IHdlIHN0
aWxsIG5lZWQgbG9nZ2luZyB0byBpbmRpY2F0ZSBzZXNzaW9ucy4gIEknZCBhbHNvIGFzc3VtZSB0
aGF0Cj4gbG9nZ2luZyBpbXBsaWVzIHNvbWUgb3ZlcmhlYWQgZm9yIHRoZSB2ZW5kb3IgZHJpdmVy
Lgo+Cm9rLiBJZiB5b3UgcHJlZmVyIGxvZ2dpbmcsIEknbSBvayB3aXRoIGl0LiBqdXN0IGZvdW5k
IG1pZ3JhdGUtaW4gYW5kCm1pZ3JhdGUtb3V0IGFyZSBtb3JlIHVuaXZlcnNhbCBhZ2FpbnQgaGFy
ZHdhcmUgcmVxdWlyZW1lbnQgY2hhbmdlcy4KCj4gPiBPbiBUdWUsIE1hciAxMiwgMjAxOSBhdCAx
MDo1Nzo0N0FNICswODAwLCBaaGFvIFlhbiB3cm90ZToKPiA+ID4gaGkgQWxleAo+ID4gPiB0aGFu
a3MgZm9yIHlvdXIgcmVwbHkuCj4gPiA+IAo+ID4gPiBTbywgaWYgd2UgY2hvb3NlIG1pZ3JhdGlv
biBkYXRhIHRvIGJlIHVzZXJzcGFjZSBvcGFxdWUsIGRvIHlvdSB0aGluayBiZWxvdwo+ID4gPiBz
ZXF1ZW5jZSBpcyB0aGUgcmlnaHQgYmVoYXZpb3IgZm9yIHZlbmRvciBkcml2ZXIgdG8gZm9sbG93
Ogo+ID4gPiAKPiA+ID4gMS4gaW5pdGlhbGx5IExPR0dJTkcgc3RhdGUgaXMgbm90IHNldC4gSWYg
dXNlcnNwYWNlIGNhbGxzIEdFVF9CVUZGRVIgdG8KPiA+ID4gdmVuZG9yIGRyaXZlciwgIHZlbmRv
ciBkcml2ZXIgc2hvdWxkIHJlamVjdCBhbmQgcmV0dXJuIDAuCj4gCj4gV2hhdCB3b3VsZCB0aGlz
IHN0YXRlIG1lYW4gb3RoZXJ3aXNlPyAgSWYgd2UncmUgbm90IGxvZ2dpbmcgdGhlbiBpdAo+IHNo
b3VsZCBub3QgYmUgZXhwZWN0ZWQgdGhhdCB3ZSBjYW4gY29uc3RydWN0IGRpcnRpZWQgZGF0YSBm
cm9tIGEKPiBwcmV2aW91cyByZWFkIG9mIHRoZSBzdGF0ZSBiZWZvcmUgbG9nZ2luZyB3YXMgZW5h
YmxlZCAoaXQgd291bGQgYmUKPiBvdXRzaWRlIG9mIHRoZSAic2Vzc2lvbiIpLiAgU28gYXQgYmVz
dCB0aGlzIGlzIGFuIGluY29tcGxldGUgc2VnbWVudCBvZgo+IHRoZSBpbml0aWFsIHNuYXBzaG90
IG9mIHRoZSBkZXZpY2UsIGJ1dCB0aGF0IHByZXN1bWVzIGhvdyB0aGUgdmVuZG9yCj4gZHJpdmVy
IGNvbnN0cnVjdHMgdGhlIGRhdGEuICBJIHdvdWxkbid0IG5lY2Vzc2FyaWx5IG1hbmRhdGUgdGhl
IHZlbmRvcgo+IGRyaXZlciByZWplY3QgaXQsIGJ1dCBJIHRoaW5rIHdlIHNob3VsZCBjb25zaWRl
ciBpdCB1bmRlZmluZWQgYW5kCj4gdmVuZG9yIHNwZWNpZmljIHJlbGF0aXZlIHRvIHRoZSBtaWdy
YXRpb24gaW50ZXJmYWNlLgo+IAo+ID4gPiAyLiB0aGVuIExPR0dJTkcgc3RhdGUgaXMgc2V0LCBp
ZiB1c2Vyc3BhY2UgY2FsbHMgR0VUX0JVRkZFUiB0byB2ZW5kb3IKPiA+ID4gZHJpdmVyLAo+ID4g
PiAgICBhLiB2ZW5kb3IgZHJpdmVyIHNob3VkIGZpcnN0IHF1ZXJ5IGEgd2hvbGUgc25hcHNob3Qg
b2YgZGV2aWNlIG1lbW9yeQo+ID4gPiAgICAobGV0J3MgdXNlIHRoaXMgdGVybSB0byByZXByZXNl
bnQgZGV2aWNlJ3Mgc3RhbmRhbG9uZSBtZW1vcnkgZm9yIG5vdyksCj4gPiA+ICAgIGIuIHZlbmRv
ciBkcml2ZXIgcmV0dXJucyBhIGNodW5rIG9mIGRhdGEganVzdCBxdWVyaWVkIHRvIHVzZXJzcGFj
ZSwKPiA+ID4gICAgd2hpbGUgcmVjb3JkaW5nIGN1cnJlbnQgcG9zIGluIGRhdGEuCj4gPiA+ICAg
IGMuIHZlbmRvciBkcml2ZXIgZmluZHMgYWxsIGRhdGEganVzdCBxdWVyaWVkIGlzIGZpbmlzaGVk
IHRyYW5zbWl0dGluZyB0bwo+ID4gPiAgICB1c2Vyc3BhY2UsIGFuZCBxdWVyaWVzIG9ubHkgZGly
dHkgZGF0YSBpbiBkZXZpY2UgbWVtb3J5IG5vdy4KPiA+ID4gICAgZC4gdmVuZG9yIGRyaXZlciBy
ZXR1cm5zIGEgY2h1bmsgb2YgZGF0YSBqdXN0IHF1ZXJlZCAodGhpcyB0aW1lIGlzIGRpcnR5Cj4g
PiA+ICAgIGRhdGEgKXRvIHVzZXJzcGFjZSB3aGlsZSByZWNvcmRpbmcgY3VycmVudCBwb3MgaW4g
ZGF0YQo+ID4gPiAgICBlLiBpZiBhbGwgZGF0YSBpcyB0cmFuc21pdGVkIHRvIHVzZXNwYWNlIGFu
ZCBzdGlsbCBHRVRfQlVGRkVScyBjb21lIGZyb20KPiA+ID4gICAgdXNlcnNwYWNlLCB2ZW5kb3Ig
ZHJpdmVyIHN0YXJ0cyBhbm90aGVyIHJvdW5kIG9mIGRpcnR5IGRhdGEgcXVlcnkuCj4gCj4gVGhp
cyBpcyBhIHZhbGlkIHZlbmRvciBkcml2ZXIgYXBwcm9hY2gsIGJ1dCBpdCdzIG91dHNpZGUgdGhl
IHNjb3BlIG9mCj4gdGhlIGludGVyZmFjZSBkZWZpbml0aW9uLiAgQSB2ZW5kb3IgZHJpdmVyIGNv
dWxkIGFsc28gZGVjaWRlIHRvIG5vdAo+IHByb3ZpZGUgYW55IGRhdGEgdW50aWwgYm90aCBzdG9w
cGVkIGFuZCBsb2dnaW5nIGFyZSBzZXQgYW5kIHRoZW4KPiBwcm92aWRlIGEgZml4ZWQsIGZpbmFs
IHNuYXBzaG90LiAgVGhlIGludGVyZmFjZSBzdXBwb3J0cyBlaXRoZXIKPiBhcHByb2FjaCBieSBk
ZWZpbmluZyB0aGUgcHJvdG9jb2wgdG8gaW50ZXJhY3Qgd2l0aCBpdC4KPiAKPiA+ID4gMy4gaWYg
TE9HR0lORyBzdGF0ZSBpcyB1bnNldCB0aGVuLCBhbmQgdXNlcnBhY2UgY2FsbHMgR0VUX0JVRkZF
UiB0byB2ZW5kb3IKPiA+ID4gZHJpdmVyLAo+ID4gPiAgICBhLiBpZiB2ZW5kb3IgZHJpdmVyIGZp
bmRzIHRoZXJlJ3MgcHJldmlvdXNseSB1bnRyYW5zbWl0dGVkIGRhdGEsIHJldHVybnMKPiA+ID4g
ICAgdGhlbSB1bnRpbCBhbGwgdHJhbnNtaXR0ZWQuCj4gPiA+ICAgIGIuIHZlbmRvciBkcml2ZXIg
dGhlbiBxdWVyaWVzIGRpcnR5IGRhdGEgYWdhaW4gYW5kIHRyYW5zbWl0cyB0aGVtLgo+ID4gPiAg
ICBjLiBhdCBsYXN0LCB2ZW5kb3IgZHJpdmVyIHF1ZXJpcyBkZXZpY2UgY29uZmlnIGRhdGEgKHdo
aWNoIGhhcyB0byBiZQo+ID4gPiAgICBxdWVyaWVkIGF0IGxhc3QgYW5kIHNlbnQgb25jZSkgYW5k
IHRyYW5zbWl0cyB0aGVtLgo+IAo+IFRoaXMgc2VlbXMgYnJva2VuLCB0aGUgdmVuZG9yIGRyaXZl
ciBpcyBwcmVzdW1pbmcgdGhlIHVzZXIgaW50ZW50aW9ucy4KPiBJZiBsb2dnaW5nIGlzIHVuc2V0
LCB3ZSByZXR1cm4gdG8gYnVsbGV0IDEsIHJlYWRpbmcgZGF0YSBpcyB1bmRlZmluZWQKPiBhbmQg
dmVuZG9yIHNwZWNpZmljLiAgSXQncyBvdXRzaWRlIG9mIHRoZSBzZXNzaW9uLgo+IAo+ID4gPiBm
b3IgdGhlIDEgYnVsbGV0LCBpZiBMT0dHSU5HIHN0YXRlIGlzIGZpcnN0bHkgc2V0IGFuZCBtaWdy
YXRpb24gYWJvcnRzCj4gPiA+IHRoZW4sICB2ZW5kb3IgZHJpdmVyIGhhcyB0byBiZSBhYmxlIHRv
IGRldGVjdCB0aGF0IGNvbmRpdGlvbi4gc28gc2VlbWluZ2x5LAo+ID4gPiB2ZW5kb3IgZHJpdmVy
IGhhcyB0byBrbm93IG1vcmUgcWVtdSdzIG1pZ3JhdGlvbiBzdGF0ZSwgbGlrZSBtaWdyYXRpb24K
PiA+ID4gY2FsbGVkIGFuZCBmYWlsZWQuIERvIHlvdSB0aGluayB0aGF0J3MgYWNjZXB0YWJsZT8K
PiAKPiBJZiBtaWdyYXRpb24gYWJvcnRzLCBsb2dnaW5nIGlzIGNsZWFyZWQgYW5kIHRoZSBkZXZp
Y2UgY29udGludWVzCj4gb3BlcmF0aW9uLiAgSWYgYSBuZXcgbWlncmF0aW9uIGlzIHN0YXJ0ZWQs
IHRoZSBzZXNzaW9uIGlzIGluaXRpYXRlZCBieQo+IGVuYWJsaW5nIGxvZ2dpbmcuICBTb3VuZCBy
ZWFzb25hYmxlPyAgVGhhbmtzLAo+CgpGb3IgdGhlIGZsb3csIEkgc3RpbGwgaGF2ZSBhIHF1ZXN0
aW9uLgpUaGVyZSBhcmUgMiBhcHByb2FjaGVzIGJlbG93LCB3aGljaCBvbmUgZG8geW91IHByZWZl
cj8KCkFwcHJvYWNoIEEsIGluIHByZWNvcHkgc3RhZ2UsIHRoZSBzZXF1ZW5jZSBpcwoKKDEpCi5z
YXZlX2xpdmVfcGVuZGluZyAtLT4gcmV0dXJuIHdob2xlIHNuYXBzaG90IHNpemUKLnNhdmVfbGl2
ZV9pdGVyYXRlIC0tPiBzYXZlIHdob2xlIHNuYXBzaG90CgooMikKLnNhdmVfbGl2ZV9wZW5kaW5n
IC0tPiBnZXQgZGlydHkgZGF0YSwgcmV0dXJuIGRpcnR5IGRhdGEgc2l6ZQouc2F2ZV9saXZlX2l0
ZXJhdGUgLS0+IHNhdmUgYWxsIGRpcnR5IGRhdGEKCigzKQouc2F2ZV9saXZlX3BlbmRpbmcgLS0+
IGdldCBkaXJ0eSBkYXRhIGFnYWluLCByZXR1cm4gZGlydHkgZGF0YSBzaXplCi5zYXZlX2xpdmVf
aXRlcmF0ZSAtLT4gc2F2ZSBhbGwgZGlydHkgZGF0YQoKCkFwcHJvYWNoIEIsIGluIHByZWNvcHkg
c3RhZ2UsIHRoZSBzZXF1ZW5jZSBpcwooMSkKLnNhdmVfbGl2ZV9wZW5kaW5nIC0tPiByZXR1cm4g
d2hvbGUgc25hcHNob3Qgc2l6ZQouc2F2ZV9saXZlX2l0ZXJhdGUgLS0+IHNhdmUgcGFydCBvZiBz
bmFwc2hvdAoKKDIpCi5zYXZlX2xpdmVfcGVuZGluZyAtLT4gcmV0dXJuIHJlc3QgcGFydCBvZiB3
aG9sZSBzbmFwc2hvdCBzaXplICsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3VycmVu
dCBkaXJ0eSBkYXRhIHNpemUKLnNhdmVfbGl2ZV9pdGVyYXRlIC0tPiBzYXZlIHBhcnQgb2Ygc25h
cHNob3QgCgooMykgcmVwZWF0ICgyKSB1bnRpbCB3aG9sZSBzbmFwc2hvdCBzYXZlZC4KCig0KSAK
LnNhdmVfbGl2ZV9wZW5kaW5nIC0tPiBnZXQgZGlyeXQgZGF0YSBhbmQgcmV0dXJuIGN1cnJlbnQg
ZGlydHkgZGF0YSBzaXplCi5zYXZlX2xpdmVfaXRlcmF0ZSAtLT4gc2F2ZSBwYXJ0IG9mIGRpcnR5
IGRhdGEKCig1KQouc2F2ZV9saXZlX3BlbmRpbmcgLS0+IHJldHVybiByZXNldCBwYXJ0IG9mIGRp
cnR5IGRhdGEgc2l6ZSArCgkJCSAgICAgZGVsdGEgc2l6ZSBvZiBkaXJ0eSBkYXRhCi5zYXZlX2xp
dmVfaXRlcmF0ZSAtLT4gc2F2ZSBwYXJ0IG9mIGRpcnR5IGRhdGEKCig2KQpyZXBlYXQgKDUpIHVu
dGlsIHByZWNvcHkgc3RvcHMKCgo+IEFsZXgKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0Cj4gaW50ZWwt
Z3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
