// Initial wiring: [7, 2, 6, 3, 4, 0, 8, 5, 1]
// Resulting wiring: [7, 2, 6, 3, 4, 0, 8, 5, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[3], q[4];
cx q[4], q[3];
cx q[3], q[2];
cx q[4], q[3];
cx q[3], q[4];
cx q[4], q[1];
