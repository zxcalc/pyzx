// Initial wiring: [5 0 2 3 4 1 6 7 8]
// Resulting wiring: [6 0 2 3 4 1 5 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[5], q[6];
cx q[5], q[0];
cx q[2], q[1];
