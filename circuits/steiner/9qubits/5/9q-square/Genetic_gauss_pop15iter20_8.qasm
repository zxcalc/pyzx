// Initial wiring: [1 0 2 4 6 7 5 3 8]
// Resulting wiring: [1 0 2 3 6 7 5 4 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[5], q[4];
cx q[0], q[5];
cx q[1], q[2];
cx q[8], q[7];
