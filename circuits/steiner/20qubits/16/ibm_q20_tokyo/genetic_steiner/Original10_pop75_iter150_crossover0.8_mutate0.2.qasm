// Initial wiring: [17, 1, 0, 10, 5, 18, 12, 15, 7, 2, 13, 14, 6, 16, 8, 4, 9, 19, 11, 3]
// Resulting wiring: [17, 1, 0, 10, 5, 18, 12, 15, 7, 2, 13, 14, 6, 16, 8, 4, 9, 19, 11, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[3];
cx q[9], q[0];
cx q[10], q[9];
cx q[14], q[13];
cx q[13], q[6];
cx q[14], q[13];
cx q[15], q[14];
cx q[17], q[18];
cx q[16], q[17];
cx q[11], q[12];
cx q[8], q[9];
cx q[7], q[12];
cx q[12], q[11];
cx q[5], q[6];
cx q[6], q[12];
cx q[12], q[11];
cx q[11], q[12];
cx q[2], q[7];
cx q[7], q[12];
cx q[12], q[11];
cx q[11], q[9];
