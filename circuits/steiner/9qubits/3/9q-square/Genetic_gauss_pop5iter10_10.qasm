// Initial wiring: [0 4 2 1 7 5 6 3 8]
// Resulting wiring: [0 4 2 1 7 5 6 3 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[4], q[3];
cx q[3], q[8];
