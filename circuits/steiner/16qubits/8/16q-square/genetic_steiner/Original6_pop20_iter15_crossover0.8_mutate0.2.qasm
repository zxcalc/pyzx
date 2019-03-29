// Initial wiring: [3, 7, 9, 1, 2, 13, 11, 4, 8, 10, 5, 0, 14, 12, 6, 15]
// Resulting wiring: [3, 7, 9, 1, 2, 13, 11, 4, 8, 10, 5, 0, 14, 12, 6, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[5], q[2];
cx q[10], q[9];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[6];
cx q[11], q[4];
cx q[11], q[10];
cx q[12], q[11];
cx q[11], q[4];
cx q[12], q[11];
cx q[14], q[9];
cx q[9], q[6];
cx q[14], q[9];
cx q[15], q[14];
cx q[14], q[15];
cx q[10], q[13];
cx q[9], q[14];
cx q[14], q[15];
