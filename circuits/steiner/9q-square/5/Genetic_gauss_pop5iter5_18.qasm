// Initial wiring: [6 1 2 3 4 0 5 7 8]
// Resulting wiring: [6 0 2 3 4 1 5 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[0], q[1];
cx q[3], q[4];
cx q[4], q[3];
cx q[1], q[4];
cx q[4], q[5];
