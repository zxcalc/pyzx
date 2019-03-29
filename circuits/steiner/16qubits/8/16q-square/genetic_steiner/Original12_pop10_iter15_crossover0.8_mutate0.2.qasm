// Initial wiring: [1, 15, 7, 12, 3, 10, 2, 8, 9, 13, 4, 5, 11, 6, 0, 14]
// Resulting wiring: [1, 15, 7, 12, 3, 10, 2, 8, 9, 13, 4, 5, 11, 6, 0, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[4];
cx q[4], q[3];
cx q[9], q[8];
cx q[11], q[4];
cx q[4], q[3];
cx q[14], q[13];
cx q[14], q[15];
cx q[13], q[14];
cx q[10], q[13];
cx q[13], q[14];
cx q[14], q[15];
cx q[14], q[13];
cx q[6], q[7];
