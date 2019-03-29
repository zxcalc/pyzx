// Initial wiring: [13, 10, 12, 14, 8, 19, 16, 6, 1, 11, 2, 0, 7, 3, 5, 17, 15, 4, 18, 9]
// Resulting wiring: [13, 10, 12, 14, 8, 19, 16, 6, 1, 11, 2, 0, 7, 3, 5, 17, 15, 4, 18, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[1];
cx q[1], q[0];
cx q[11], q[8];
cx q[17], q[12];
cx q[12], q[6];
cx q[18], q[17];
cx q[18], q[11];
cx q[10], q[11];
